require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Treasury do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @treasury = Etsy4r::Treasury.new(@client)
  end
  
  context "find all treasuries" do
    it "should get all treasuries" do
      VCR.use_cassette('treasury') do
        @res = @treasury.find_all_treasuries
        @res.should be_success
        @res.results.should_not be_nil
        @res.paginator.should_not be_nil
      end
    end
  end
  
  context "get treasury" do
    it "should get the requested treasury" do
      VCR.use_cassette('treasury') do
        @res = @treasury.get_treasury(1)
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
end
