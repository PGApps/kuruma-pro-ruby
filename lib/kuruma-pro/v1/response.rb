module KurumaPro
  module V1
    class Response
      def initialize(response)
        @raw_response = response
      end

      def success?
        @raw_response.success?
      end

      #FIXME NOT IMPLEMENTED
      def error_messages
        []
      end

      #FIXME NOT IMPLEMENTED
      def data
        {}
      end
    end
  end
end
