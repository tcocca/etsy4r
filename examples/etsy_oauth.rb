require File.dirname(__FILE__) + '/../lib/etsy4r'
require 'yaml'
require 'webmock'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = File.dirname(__FILE__) + '/../spec/fixtures/vcr_cassettes'
  c.http_stubbing_library = :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

oauth_config = YAML.load_file(File.join(File.dirname(__FILE__), '../spec/etsy_credentials.yml'))

VCR.use_cassette('oauth') do
  etsy_oauth = Etsy4r::OAuthClient.new(
    oauth_config["oauth"]["consumer_token"], 
    oauth_config["oauth"]["consumer_secret"], 
    :site => 'http://openapi.etsy.com', 
    :request_token_path => '/v2/sandbox/oauth/request_token', 
    :access_token_path => '/v2/sandbox/oauth/access_token', 
    :authorize_url => 'https://www.etsy.com/oauth/signin', 
    :request_endpoint => 'http://openapi.etsy.com'
  )

  request_token = etsy_oauth.request_token.token
  request_secret = etsy_oauth.request_token.secret

  puts "> redirecting you to twitter to authorize..."
  %x(open #{etsy_oauth.request_token.authorize_url})

  print "> what was the PIN etsy provided you with? "
  etsy_pin = gets.chomp

  begin
    etsy_oauth.authorize_from_request(request_token, request_secret, etsy_pin)
    puts "> Logged in successfully ..."
  rescue OAuth::Unauthorized
    puts "> OAuth authentication failed ..."
  end
end
