module KurumaPro
  class Config
    attr_reader :api_key, :api_endpoint, :api_version, :logger

    def initialize(opts)
      @api_key = nil
      @api_endpoint = "https://shop-api.kuruma.pro"
      @api_version = "v1"

      update(opts)
      unless @logger
        require 'logger'
        @logger = Logger.new(STDOUT)
      end

      raise "API Key is must not nil" unless @api_key
    end

    def update(opts)
      raise "opts is must not nil" unless opts
      @api_key = opts[:api_key] if opts[:api_key]
      @api_endpoint = opts[:api_endpoint] if opts[:api_endpoint]
      @api_version = opts[:api_version] if opts[:api_version]
      @logger = opts[:logger] if opts[:logger]
    end
  end
end
