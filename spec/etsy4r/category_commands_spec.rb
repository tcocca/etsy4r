require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/etsy4r'

describe Etsy4r::CategoryCommands do
  include Etsy4rSpecHelper
  
  before do
    @client = etsy4r_client
    @category_commands = Etsy4r::CategoryCommands.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @category_commands.client.class.should == Etsy4r::Client
    end
  end
  
  describe 'get_top_categories' do
    it 'should return the top level tags' do
      @res = @category_commands.get_top_categories
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
  describe 'get_child_categories' do
    it 'should return child tags when given a formatted tag' do
      @res = @category_commands.get_child_categories('bags_and_purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    
    it 'should return child tags when given a tag with spaces' do
      @res = @category_commands.get_child_categories('bags and purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
    it 'should return child tags when given a tag with dashes' do
      @res = @category_commands.get_child_categories('bags-and-purses')
      @res.should be_success
      @res.results.should_not be_nil
      @res.error_message.should be_blank
    end
  end
  
end
