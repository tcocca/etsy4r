ETSY_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), '../etsy_credentials.yml'))

module Etsy4rSpecHelper
  
  def etsy4r_client
    Etsy4r::Client.new(ETSY_CONFIG["api_key"])
  end
  
  def etsy4r_oauth_client
    Etsy4r::OAuthClient.new(
      ETSY_CONFIG["oauth"]["consumer_token"], 
      ETSY_CONFIG["oauth"]["consumer_secret"], 
      :site => 'http://openapi.etsy.com', 
      :request_token_path => '/v2/sandbox/oauth/request_token', 
      :access_token_path => '/v2/sandbox/oauth/access_token', 
      :authorize_url => 'https://www.etsy.com/oauth/signin', 
      :request_endpoint => 'http://openapi.etsy.com'
    )
  end
  
end
