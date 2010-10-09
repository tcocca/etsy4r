$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'etsy4r'
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'
require 'vcr'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  config.include WebMock
end

VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.http_stubbing_library = :webmock
  c.default_cassette_options = { :record => :new_episodes }
end
