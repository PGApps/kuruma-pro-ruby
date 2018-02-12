describe KurumaPro::Config do
  describe "#initialize" do
    context "specified by hash arguments" do
      it do
        config = KurumaPro::Config.new(
          api_key: 'hoge',
        )
        expect(config.api_key).to eq('hoge')
        expect(config.api_endpoint).to eq('https://shop-api.kuruma.pro')
        expect(config.api_version).to eq('v1')
      end
    end
  end
end
