require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::ListingCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @listing_commands = Etsy4r::ListingCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @listing_commands.client.class.should == Etsy4r::Client
    end
  end
  
end
