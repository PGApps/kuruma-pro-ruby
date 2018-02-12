require 'json'
require 'rest-client'

require 'kuruma-pro/api/item'
require 'kuruma-pro/api/medium'
require 'kuruma-pro/api/order'
require 'kuruma-pro/api/shop'

module KurumaPro
  class Client
    include KurumaPro::API::Item
    include KurumaPro::API::Medium
    include KurumaPro::API::Order
    include KurumaPro::API::Shop

    def initialize(opts)
      @config = Config.new(opts)
    end

    def logger
      @config.logger
    end

    def request_url(url)
      "#{@config.api_endpoint}/#{@config.api_version}#{url}"
    end

    def request(method, url, params, headers={})
      opt = {
        method: method,
        url: url,
        headers: headers,
      }
      opt[:headers][:'x-kuruma-api-key'] ||= "#{@config.api_key}"
      opt[:headers][:'Accept'] = 'application/json'

      if method == :get
        opt[:url] = params.blank? ? url : "#{url}?#{RestClient::Payload::UrlEncoded.new(params).to_s}"
      else
        opt[:headers][:'Content-Type'] ||= 'application/json'
        if opt[:headers][:'Content-Type'] == 'application/octet-stream'
          opt[:payload] = params
        else
          opt[:payload] = params.to_json
        end
      end

      @logger.debug "request. opt=#{opt}"
      Response.parse(RestClient::Request.execute(opt))
    end
  end
end
