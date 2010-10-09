require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Client do
  include Etsy4rSpecHelper
  
  describe 'initialize' do
    before do
      @client = etsy4r_client
    end
    
    it 'sets the base_uri' do 
      @client.class.base_uri.should == 'http://openapi.etsy.com/v2/sandbox/public'
    end
    
    it 'sets default params to include the api key' do
      @client.class.default_params.keys.should == [:api_key]
      @client.class.default_params[:api_key].should_not be_blank
    end
  end
  
end
