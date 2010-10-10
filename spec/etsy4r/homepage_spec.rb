require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Homepage do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @homepage = Etsy4r::Homepage.new(@client)
  end
  
  context "find all active featured listing pickers" do
    it "should get all active featured listing pickers" do
      VCR.use_cassette('homepage') do
        @res = @homepage.find_all_featured_listing_picker_active
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should_not be_nil
      end
    end
  end
  
  context "get featured listing pickers" do
    it "should pickers for the requested listings" do
      VCR.use_cassette('miscellaneous') do
        @res = @homepage.get_featured_listing_picker('29139,29142')
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should be_nil
      end
    end
    
    it "should accept a string of comma separated ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @homepage.get_featured_listing_picker('29139,29142')
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should be_nil
      end
    end
    
    it "should accept an array of ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @homepage.get_featured_listing_picker([29139,29142])
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should be_nil
      end
    end
  end
  
  context "find all active featured listing pickers" do
    it "should get all active featured listing pickers for a featured listing" do
      VCR.use_cassette('homepage') do
        @res = @homepage.find_all_featured_listing_picker_featured(29139)
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should_not be_nil
      end
    end
  end
  
end
