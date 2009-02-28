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
  
  describe 'get_shop_details' do
    it 'should return details when given a user_id' do
      @res = @shop_commands.get_shop_details(5565464)
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
    
    it 'should return details when given a user_name' do
      @res = @shop_commands.get_shop_details('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
    
    it 'should accept detail_level as an optional param' do
      @res = @shop_commands.get_shop_details(5565464, :detail_level => 'high')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_featured_sellers' do
    it 'should return the list of featured sellers' do
      @res = @shop_commands.get_featured_sellers
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings' do
    it 'should return listings when given a user_id' do
      @res = @shop_commands.get_listings(5565464)
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given a user_name' do
      @res = @shop_commands.get_listings('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_shops_by_name' do
    it 'should return shops when given a search_name' do
      @res = @shop_commands.get_shops_by_name('amanda')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
    
    it 'should return shops when given a search_name with spaces' do
      @res = @shop_commands.get_shops_by_name('amanda t')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_featured_details' do
    it 'should return featured listings when given a user_id' do
      @res = @shop_commands.get_featured_details(5565464)
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
    
    it 'should return featured listings when given a user_name' do
      @res = @shop_commands.get_featured_details('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_blank
      @res.error_message.should be_blank
    end
  end
  
end
