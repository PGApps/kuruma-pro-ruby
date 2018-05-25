describe KurumaPro::API::Item do
  let(:client) { KurumaPro::Client.new({api_key: "hoge"}) }

  describe "#store_item" do
    subject { client.store_item(params) }

    context "invalid params" do
      let(:params) { {} }
      it do
        expect(client).to receive(:request).and_return(nil).exactly(0).times
        expect{subject}.to raise_error(JSON::Schema::ValidationError)
      end
    end
  end
end
