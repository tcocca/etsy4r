require File.dirname(__FILE__) + '/../spec_helper'

describe Etsy4r::Server do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @server_commands = Etsy4r::Server.new(@client)
  end
    
  describe 'initialize' do
    it 'set the client' do
      @server_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_method_table' do
    it 'should get all methods' do
      VCR.use_cassette('server') do
        @res = @server_commands.get_method_table
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
  describe 'ping' do
    it 'should ping the server' do
      VCR.use_cassette('server') do
        @res = @server_commands.ping
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
  describe 'get_server_epoch' do
    it 'should return the server time' do
      VCR.use_cassette('server') do
        @res = @server_commands.get_server_epoch
        @res.should be_success
        @res.results.should_not be_nil
      end
    end
  end
  
end
