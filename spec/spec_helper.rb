begin
  require 'spec'
  require 'mocha'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
  require 'mocha'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'etsy4r'

module Etsy4rSpecHelper
  
  def etsy4r_client
    Etsy4r::Client.new('dacmw5zgq4x82z95ben5em6v')
  end
  
end
