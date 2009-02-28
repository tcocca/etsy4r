require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::FavoriteCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @favorite_commands = Etsy4r::FavoriteCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @favorite_commands.client.class.should == Etsy4r::Client
    end
  end
  
end
