require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::ShopCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @shop_commands = Etsy4r::ShopCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @shop_commands.client.class.should == Etsy4r::Client
    end
  end
  
end
