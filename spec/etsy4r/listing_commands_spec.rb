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
  
  describe 'get_listing_details' do
    it 'should return details' do
      @res = @listing_commands.get_listing_details(19749826)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take the detail_level optional param' do
      @res = @listing_commands.get_listing_details(19749826, :detail_level => 'high')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_tags' do
    it 'should take an array of tags' do
      @res = @listing_commands.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take the optional params sort_on and sort_order' do
      @res = @listing_commands.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'], :sort_on => 'price', :sort_order => 'down')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_keywords' do
    it 'should take an array of keywords' do
      @res = @listing_commands.get_listings_by_keywords(['bags_and_purses', 'art', 'shoulder bag'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take the optional params sort_on and sort_order' do
      @res = @listing_commands.get_listings_by_keywords(['bags_and_purses', 'art', 'shoulder bag'], :sort_on => 'price', :sort_order => 'down')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take the optional params min_price and max_prce' do
      @res = @listing_commands.get_listings_by_keywords(['bags_and_purses', 'art', 'shoulder bag'], :min_price => 0, :max_price => 22.99)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_front_featured_listings' do
    it 'should return the listings' do
      @res = @listing_commands.get_front_featured_listings
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take optional params' do
      @res = @listing_commands.get_front_featured_listings(:detail_level => 'medium', :limit => 45, :offset => 45)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
