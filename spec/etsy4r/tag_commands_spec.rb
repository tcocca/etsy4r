require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::TagCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @tag_commands = Etsy4r::TagCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @tag_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_top_tags' do
    it 'should return the top level tags' do
      @res = @tag_commands.get_top_tags
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_child_tags' do
    it 'should return child tags when given a formatted tag' do
      @res = @tag_commands.get_child_tags('bags_and_purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return child tags when given a tag with spaces' do
      @res = @tag_commands.get_child_tags('bags and purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    it 'should return child tags when given a tag with dashes' do
      @res = @tag_commands.get_child_tags('bags-and-purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
