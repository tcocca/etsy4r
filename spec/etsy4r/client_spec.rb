require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'
require File.dirname(__FILE__) + '/../../lib/etsy4r/client'

describe Etsy4r::Client do
  include Etsy4rSpecHelper
  
  describe 'initialize' do
    before do
      @client = etsy4r_client
    end
    
    it 'sets the base_uri' do 
      @client.class.base_uri.should == 'http://beta-api.etsy.com/v1'
    end
    
    it 'sets default params to include the api key' do
      @client.class.default_params.should == {:api_key => 'dacmw5zgq4x82z95ben5em6v'}
    end
  end
  
end
