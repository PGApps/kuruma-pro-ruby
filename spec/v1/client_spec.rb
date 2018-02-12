describe KurumaPro::V1::Client do
  context "#initialize" do
    it "should return default values when not specify arguments" do
      client = KurumaPro::V1::Client.new()
      expect(client.api_key).to eq nil
      expect(client.api_endpoint).to eq "https://api.kuruma.pro/v1"
      expect(client.logger.nil?).to be false
    end

    it "should return specified values when specify arguments" do
      logger = Logger.new(STDOUT)
      client = KurumaPro::V1::Client.new(
        api_key: "hoge",
        api_endpoint: "https://api.example.com",
        logger: logger,
      )
      expect(client.api_key).to eq "hoge"
      expect(client.api_endpoint).to eq "https://api.example.com"
      expect(client.logger).to be logger
    end
  end
end
