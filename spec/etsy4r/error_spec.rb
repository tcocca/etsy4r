require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Error do
  include Etsy4rSpecHelper
  
  context "translate mashery code" do
    it "should translate the masery code when given the x-error-detail header" do
      headers = {
        "x-mashery-responder" => "proxyworker-i-9167f2f8.mashery.com",
        "content-type" => "text/plain;charset=UTF-8",
        "server" => "Apache",
        "date" => "Sat, 09 Oct 2010 12:57:13 GMT",
        "x-error-detail" => "No country exists for id: 11",
        "accept-ranges" => "bytes",
        "content-length" => "28"
      }
      @error = Etsy4r::Error.new(404, 'Not Found', headers)
      @error.message.should == "Etsy4r Error: No country exists for id: 11 (code: 404, error: Not Found)"
    end
    
    it "should translate the masery code when given only the x-error-detail header" do
      headers = {
        "x-mashery-responder" => "proxyworker-i-9167f2f8.mashery.com",
        "x-mashery-error-code" => "ERR_403_DEVELOPER_INACTIVE",
        "content-type" => "text/xml",
        "accept-ranges" => "bytes",
        "content-length" => "31",
        "date" => "Sat, 09 Oct 2010 00:45:44 GMT",
        "server" => "Mashery Proxy"
      }
      @error = Etsy4r::Error.new(403, 'Forbidden', headers)
      @error.message.should == "Etsy4r Error: Developer Inactive (code: 403, error: Forbidden)"
    end
    
    it "should translate the masery code when given only both headers" do
      headers = {
        "x-mashery-responder" => "proxyworker-i-9167f2f8.mashery.com",
        "x-mashery-error-code" => "ERR_403_DEVELOPER_INACTIVE",
        "x-error-detail" => "No country exists for id: 11",
        "content-type" => "text/xml",
        "accept-ranges" => "bytes",
        "content-length" => "31",
        "date" => "Sat, 09 Oct 2010 00:45:44 GMT",
        "server" => "Mashery Proxy"
      }
      @error = Etsy4r::Error.new(404, 'Not Found', headers)
      @error.message.should == "Etsy4r Error: No country exists for id: 11 (code: 404, error: Not Found)"
    end
    
    it "should translate the masery code when given neither header" do
      headers = {
        "x-mashery-responder" => "proxyworker-i-9167f2f8.mashery.com",
        "content-type" => "text/xml",
        "accept-ranges" => "bytes",
        "content-length" => "31",
        "date" => "Sat, 09 Oct 2010 00:45:44 GMT",
        "server" => "Mashery Proxy"
      }
      @error = Etsy4r::Error.new(404, 'Not Found', headers)
      @error.message.should == "Etsy4r Error: Not Found (code: 404)"
    end
  end
  
end
