require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Error do
  include Etsy4rSpecHelper
  
  context "translate mashery code" do
    before do
      @error = Etsy4r::Error.new(403, 'Forbidden', 'ERR_403_DEVELOPER_INACTIVE')
    end
  
    it "should translate the masery code" do
      @error.message.should == "Etsy4r Error: Developer Inactive (code: 403, error: Forbidden)"
    end
  end
  
end
