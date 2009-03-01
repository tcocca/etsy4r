require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::ServerCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @server_commands = Etsy4r::ServerCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @server_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_method_table' do
    it 'should get all methods' do
      @res = @server_commands.get_method_table
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'ping' do
    it 'should ping the server' do
      @res = @server_commands.ping
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_server_epoch' do
    it 'should return the server time' do
      @res = @server_commands.get_server_epoch
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
