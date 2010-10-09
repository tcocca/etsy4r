require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Favorites do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @favorite_commands = Etsy4r::Favorites.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @favorite_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_favorers_of_shop' do
    it 'should return users who favor the shop' do
      @res = @favorite_commands.get_favorers_of_shop(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should accept the optional params' do
      @res = @favorite_commands.get_favorers_of_shop(5565464, :detail_level => 'high', :limit => 5, :offset => 5)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_favorers_of_listing' do
    it 'should return users who favor the user' do
      @res = @favorite_commands.get_favorers_of_listing(19749826)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should accept the optional params' do
      @res = @favorite_commands.get_favorers_of_listing(19749826, :detail_level => 'high', :limit => 5, :offset => 0)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_favorite_shops_of_user' do
    it 'should return users who favor the user' do
      @res = @favorite_commands.get_favorite_shops_of_user(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should accept the optional params' do
      @res = @favorite_commands.get_favorite_shops_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_favorite_listings_of_user' do
    it 'should return users who favor the user' do
      @res = @favorite_commands.get_favorite_listings_of_user(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should accept the optional params' do
      @res = @favorite_commands.get_favorite_listings_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
end
