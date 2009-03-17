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
  
  describe 'get_all_listings' do
    it 'should return listings' do
      @res = @listing_commands.get_all_listings
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take optional params' do
      @res = @listing_commands.get_all_listings(:detail_level => 'medium', :limit => 45, :offset => 45, :sort_on => 'ending', :sort_order => 'down')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_category' do 
    it 'should return listings' do
      @res = @listing_commands.get_listings_by_category('bags_and_purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given a category with spaces' do
      @res = @listing_commands.get_listings_by_category('bags and purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take optional params' do
      @res = @listing_commands.get_listings_by_category('bags and purses', :detail_level => 'medium', :limit => 45, :offset => 45, :sort_on => 'price', :sort_order => 'down')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_color' do
    it 'should return listings when given 6 hex digits' do
      @res = @listing_commands.get_listings_by_color('FFFFFF')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given 6 hex digits with a pound sign' do
      @res = @listing_commands.get_listings_by_color('#FFFFFF')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given an HSV format' do
      @res = @listing_commands.get_listings_by_color('360;100;100')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take optional params' do
      @res = @listing_commands.get_listings_by_color('FFFFFF', :detail_level => 'medium', :limit => 45, :offset => 45, :wiggle => 10)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_materials' do
    it 'should take an array of materials' do
      @res = @listing_commands.get_listings_by_materials(['cotton', 'wool'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take the optional params sort_on and sort_order' do
      @res = @listing_commands.get_listings_by_materials(['cotton', 'wool'], :sort_on => 'price', :sort_order => 'down')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_listings_by_color_and_keywords' do
    it 'should return listings when a hex color and keywords' do
      @res = @listing_commands.get_listings_by_color_and_keywords('FFFFFF', ['bags', 'bracelets'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given a hex color with pound and keywords' do
      @res = @listing_commands.get_listings_by_color_and_keywords('#FFFFFF', ['bags', 'bracelets'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return listings when given an HSV color and keywords' do
      @res = @listing_commands.get_listings_by_color_and_keywords('360;100;100', ['bags', 'bracelets'])
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should take optional params' do
      @res = @listing_commands.get_listings_by_color_and_keywords('FFFFFF', ['bags', 'bracelets'], :detail_level => 'medium', :limit => 45, :offset => 45, :wiggle => 10)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
