require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Miscellaneous do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @miscellaneous = Etsy4r::Miscellaneous.new(@client)
  end
  
  context "find all countries" do
    it "should get all countries" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.find_all_country
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
  context "get country" do
    it "should return the requested country" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_country('209')
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
    
    it "should accept a string of comma separated ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_country('209,302')
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
    
    it "should accept an array of ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_country([209,302])
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
  context "find all regions" do
    it "should get all regions" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.find_all_region
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
  context "get region" do
    it "should return the requested region" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_region('11')
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
    
    it "should accept a string of comma separated ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_region('11,12')
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
    
    it "should accept an array of ids" do
      VCR.use_cassette('miscellaneous') do
        @res = @miscellaneous.get_region([11,12])
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
end
