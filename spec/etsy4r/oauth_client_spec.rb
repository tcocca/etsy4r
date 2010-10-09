require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::OAuthClient do
  include Etsy4rSpecHelper
  
  describe 'initialize' do
    before do
      @client = etsy4r_oauth_client
    end
    
    it 'sets the base_uri' do 
      @client.class.base_uri.should == 'http://openapi.etsy.com/v2/sandbox/private'
    end
    
    it "should not return an error on authorize" do
      VCR.use_cassette('oauth') do
        lambda {
          request_token = @client.request_token.token
          request_secret = @client.request_token.secret
          @client.authorize_from_request(request_token, request_secret, ETSY_CONFIG["oauth"]["pin"])
        }.should_not raise_exception(OAuth::Unauthorized)
      end
    end
    
    it "should raise an error on authorize" do
      VCR.use_cassette('oauth_failure') do
        lambda {
          request_token = @client.request_token.token
          request_secret = @client.request_token.secret
          @client.authorize_from_request(request_token, request_secret, 'test')
        }.should raise_exception(OAuth::Unauthorized)
      end
    end
  end
  
end
