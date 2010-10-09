require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Command do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @commands = Etsy4r::Command.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @commands.client.class.should == Etsy4r::Client
    end
  end
  
end
