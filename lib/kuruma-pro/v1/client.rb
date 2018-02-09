module KurumaPro
  module V1
    class Client
      include Api

			def initialize(opts)
        @api_key = opts[:api_key]
        @api_endpoint = opts[:endpoint] || "https://api.kuruma.pro/v1"
        @logger = opts[:logger] || Logger.new(STDOUT)
			end

      def logger
        @logger
      end
    end
  end
end
