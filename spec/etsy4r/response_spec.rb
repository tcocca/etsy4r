require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Response do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @server = Etsy4r::Server.new(@client)
  end
  
  context "should raise errors" do
    before do
      stub_http_request(:get, @client.class.base_uri + '/').
        with(:query => @client.class.default_params).
        to_return(:headers => {
            "X-Mashery-Responder" => "proxyworker-i-4e75c627.mashery.com",
            "X-Mashery-Error-Code" => "ERR_403_DEVELOPER_INACTIVE",
            "Content-Type" => "text/xml",
            "Accept-Ranges" => "bytes",
            "Content-Length" => "31",
            "Date" => "Sat, 09 Oct 2010 00:45:44 GMT",
            "Server" => "Mashery Proxy"
          }, 
          :status => [403, "Forbidden"]
        )
    end
    
    it "should raise an exception" do
      lambda {
        @server.get_method_table
      }.should raise_exception(Etsy4r::Error, "Etsy4r Error: Developer Inactive (code: 403, error: Forbidden)")
    end
  end
  
  context "should not raise errors" do
    before do
      mock_get(@client.class.base_uri, '/server/ping', 'server_ping', @client.class.default_params)
    end
    
    it "should not raise errors" do
      lambda {
        @server.ping
      }.should_not raise_exception
    end
  end
  
end
