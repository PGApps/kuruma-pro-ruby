module KurumaPro
  class Response
    attr_reader :raw_response

    def initialize(response)
      raise "response is must not nil" unless response
      raise "response is must RestClient::Response instance" unless response.is_a?(RestClient::Response)
      @raw_response = response
      if @raw_response
        resp_json = JSON.parse(@raw_response.body, symbolize_names: true)
        @data = resp_json[:data]
        @meta = resp_json[:meta]
      end
    end

    def self.parse(response)
      self.new(response)
    end

    def success?
      @raw_response.code == 200
    end

    def errors
      @meta[:error_messages]
    end

    def error_type
      @meta[:error_type]
    end

    def data
      @data
    end

    def code
      @raw_response.code
    end
  end
end
