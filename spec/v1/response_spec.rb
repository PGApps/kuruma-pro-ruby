describe KurumaPro::V1::Response do
  context "#initialize" do
    it "should raise when response is nil or not RestClient::Response" do
      expect{ KurumaPro::V1::Response.new(nil) }.to raise_error(StandardError)
      expect{ KurumaPro::V1::Response.new("") }.to raise_error(StandardError)
    end
  end

  describe "#success?" do
    context "200 OK" do
      let(:restclient_response) {
        net_http_res = double('net http response', :to_hash => {"Status" => ["200 OK"]}, :code => 200)
        r = double('http request', :user => nil, :password => nil, :url => 'https://127.0.0.1/v1/shops/1/items', :redirection_history => nil)
        RestClient::Response.create(JSON.generate({data:{item:{id: 1}, meta: {status: 200}}}), net_http_res, r)
      }
      it do
        expect(KurumaPro::V1::Response.new(restclient_response).success?).to be true
      end
    end

    context "400 OK" do
      let(:restclient_response) {
        net_http_res = double('net http response', :to_hash => {"Status" => ["400 Bad Request"]}, :code => 400)
        r = double('http request', :user => nil, :password => nil, :url => 'https://127.0.0.1/v1/shops/1/items', :redirection_history => nil)
        RestClient::Response.create(JSON.generate({data:nil, meta:{status: 400, error_type: 'GeneralError', error_messages: ["Invalid field1"]}}), net_http_res, r)
      }
      it do
        resp = KurumaPro::V1::Response.new(restclient_response)
        expect(resp.success?).to be false
        expect(resp.errors[0]).to eq 'Invalid field1'
        expect(resp.error_type).to eq 'GeneralError'
      end
    end

  end

  context "#errors" do
  end

  context "#data" do
  end
end
