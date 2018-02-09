module KurumaPro
  module V1
    module Api
      def request_url(url)
        "#{@api_endpoint}#{url}"
      end

      def request(method, url, params, headers={})
        raise "Not have api_key." if @api_key.blank?

        opt = {
          method: method,
          url: url,
          headers: headers,
        }
        opt[:headers][:'x-kuruma-api-key'] ||= "#{@api_key}"
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

        logger.debug "request. opt=#{opt}"
        parse_response(RestClient::Request.execute(opt))
      end

      def parse_response(response)
        Response.new(response)
      end
    end
  end
end
