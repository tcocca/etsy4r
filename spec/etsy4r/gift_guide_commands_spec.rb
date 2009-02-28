require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::GiftGuideCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @gift_guide_commands = Etsy4r::GiftGuideCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @gift_guide_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_gift_guides' do
    it 'should return all gift guides' do
      @res = @gift_guide_commands.get_gift_guides
      @res.should be_success
      @res.results.should_not be_blank
    end
  end
  
  describe 'get_gift_guide_listings' do
    it 'should return the listing in a gift guide' do
      @res = @gift_guide_commands.get_gift_guide_listings(100)
      @res.should be_success
      @res.results.should_not be_blank
      @res.count.should_not == 0
      @res.results.size.should == 10
    end
    
    it 'should not return listings given a bad guide_id' do
      @res = @gift_guide_commands.get_gift_guide_listings(1000)
      @res.should_not be_success
      @res.results.should be_blank
      @res.count.should == 0
      @res.results.size.should == 0
    end
    
    it 'shoulde return the number of listings specified' do
      @res = @gift_guide_commands.get_gift_guide_listings(100, {:limit => 40})
      @res.should be_success
      @res.results.should_not be_blank
      @res.count.should_not == 0
      @res.results.size.should <= 40
    end
  end
end
