require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::Commands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @commands = Etsy4r::Commands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @commands.client.class.should == Etsy4r::Client
    end
  end
  
end
