require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::ImageParser do
  include Etsy4rSpecHelper
  include Etsy4rImageParserSpecHelper
  
  before do
    @image_parser = Etsy4r::ImageParser.new(19781773)
    @image_parser.parse_url = File.dirname(__FILE__) + "/../fixtures/images.html"
  end
  
  describe 'initialize' do
    it 'should set the url for the page to parse' do
      @image_parser.parse_url.should_not be_blank
    end
    
    it 'should set the listing_id' do
      @image_parser.listing_id.should == 19781773
    end
    
    it 'should set the images hash' do
      @image_parser.images.should_not be_nil
    end
  end
  
  describe 'get_images' do
    it 'should set images as a hash' do
      @image_parser.images.should == test_image_hash
    end
  end
  
end
