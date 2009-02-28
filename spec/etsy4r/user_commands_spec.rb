require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::UserCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @user_commands = Etsy4r::UserCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @user_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_user_details' do
    it 'should return details for a user when given a user_id' do
      @res = @user_commands.get_user_details(5565464)
      @res.should be_success
      @res.results.should_not be_blank
    end
    
    it 'should return details for a user when given a user_name' do
      @res = @user_commands.get_user_details('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_blank
    end
    
    it 'should accept detail_level as an optional param' do
      @res = @user_commands.get_user_details('maymaydesigns', {:detail_level => 'high'})
      @res.should be_success
      @res.results.should_not be_blank
    end
  end
  
  describe 'get_users_by_name' do
    it 'should find users by the search_name provided' do
      @res = @user_commands.get_users_by_name('amanda')
      @res.should be_success
      @res.results.should_not be_blank
    end
    
    it 'should accept limit as an optional param' do
      @res = @user_commands.get_users_by_name('amanda', {:limit => 15})
      @res.should be_success
      @res.results.should_not be_blank
      @res.results.size.should <= 15
    end
    
    it 'should error on limit > 50' do
      @res = @user_commands.get_users_by_name('amanda', {:limit => 150})
      @res.should_not be_success
      @res.results.should be_blank
      @res.error_message.should_not be_blank
    end
  end
  
end
