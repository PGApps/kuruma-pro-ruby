describe KurumaPro::Response do
  context "#initialize" do
    it "should raise when response is nil or not RestClient::Response" do
      expect{ KurumaPro::Response.new(nil) }.to raise_error(StandardError)
      expect{ KurumaPro::Response.new("") }.to raise_error(StandardError)
    end
  end

  context "#parse" do
    it "should raise when response is nil or not RestClient::Response" do
      expect{ KurumaPro::Response.parse(nil) }.to raise_error(StandardError)
      expect{ KurumaPro::Response.parse("") }.to raise_error(StandardError)
    end
  end

  describe "#success?" do
    context "200 OK" do
      let(:restclient_response) {
        net_http_res = double('net http response', :to_hash => {"Status" => ["200 OK"]}, :code => 200)
        r = double('http request', :user => nil, :password => nil, :url => 'https://127.0.0.1/v1/shops/1/items', :redirection_history => nil)
        RestClient::Response.create(JSON.generate({data:{item:{id: 1}}, meta: {status: 200}}), net_http_res, r)
      }
      it do
        resp = KurumaPro::Response.new(restclient_response)
        expect(resp.success?).to be true
        expect(resp.data).to eq({item: {id: 1}})
      end
    end

    context "400 Bad Request" do
      let(:restclient_response) {
        net_http_res = double('net http response', :to_hash => {"Status" => ["400 Bad Request"]}, :code => 400)
        r = double('http request', :user => nil, :password => nil, :url => 'https://127.0.0.1/v1/shops/1/items', :redirection_history => nil)
        RestClient::Response.create(JSON.generate({data:nil, meta:{status: 400, error_type: 'GeneralError', error_messages: ["Invalid field1"]}}), net_http_res, r)
      }
      it do
        resp = KurumaPro::Response.new(restclient_response)
        expect(resp.success?).to be false
        expect(resp.errors[0]).to eq 'Invalid field1'
        expect(resp.error_type).to eq 'GeneralError'
      end
    end

  end
end
