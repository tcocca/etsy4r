require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::FeedbackCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @feedback_commands = Etsy4r::FeedbackCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @feedback_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_feedback' do
    it 'should return feedback details' do
      @res = @feedback_commands.get_feedback(17331973)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_feedback_for_user' do
    it 'should return feedback for a user when given a user_id' do
      @res = @feedback_commands.get_feedback_for_user(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return feedback for a user when given a user_name' do
      @res = @feedback_commands.get_feedback_for_user('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_feedback_as_buyer' do
    it 'should return feedback a user gave as a buyer when given a user_id' do
      @res = @feedback_commands.get_feedback_as_buyer(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return feedback a user gave as a buyer when given a user_name' do
      @res = @feedback_commands.get_feedback_as_buyer('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_feedback_for_others' do
    it 'should return feedback a user left when given a user_id' do
      @res = @feedback_commands.get_feedback_for_others(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return feedback a user left when given a user_name' do
      @res = @feedback_commands.get_feedback_for_others('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_feedback_as_seller' do
    it 'should return feedback when user was seller when given a user_id' do
      @res = @feedback_commands.get_feedback_as_seller(5565464)
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return feedback when user was seller when given a user_name' do
      @res = @feedback_commands.get_feedback_as_seller('maymaydesigns')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
