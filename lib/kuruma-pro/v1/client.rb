module KurumaPro
  module V1
    class Client
      include Api

      attr_reader :api_key, :api_endpoint

      def initialize(opts={})
        @api_key = opts[:api_key]
        @api_endpoint = opts[:api_endpoint] || "https://api.kuruma.pro/v1"
        @logger = opts[:logger]
        unless @logger
          require 'logger'
          @logger = Logger.new(STDOUT)
        end
      end

      def logger
        @logger
      end
    end
  end
end
