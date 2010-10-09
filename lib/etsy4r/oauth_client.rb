require 'oauth'

module Etsy4r
  class OAuthClient < Client
    
    base_uri 'openapi.etsy.com/v2/sandbox/private'
    
    def initialize(consumer_token, consumer_secret, options = {})
      @consumer_token = consumer_token
      @consumer_secret = consumer_secret
      @consumer_options = options
      @consumer_options[:signing_endpoint]   ||= 'http://openapi.etsy.com'
      @consumer_options[:request_endpoint]   ||= 'http://openapi.etsy.com'
      @consumer_options[:site]               ||= 'http://openapi.etsy.com'
      @consumer_options[:request_token_path] ||= '/v2/oauth/request_token' 
      @consumer_options[:access_token_path]  ||= '/v2/oauth/access_token'
      @consumer_options[:authorize_url]      ||= 'https://www.etsy.com/oauth/signin'
    end
    
    def signing_consumer
      @signing_consumer ||= ::OAuth::Consumer.new(@consumer_token, @consumer_secret, @consumer_options)
    end
    
    # Note: If using oauth with a web app, be sure to provide :oauth_callback.
    # Options:
    #   :oauth_callback => String, url that twitter should redirect to
    def request_token(options={})
      @request_token ||= signing_consumer.get_request_token(options)
    end
    
    def set_callback_url(url)
      clear_request_token
      request_token(:oauth_callback => url)
    end
    
    # For web apps use params[:oauth_verifier], for desktop apps,
    # use the verifier is the pin that twitter gives users.
    def authorize_from_request(request_token, request_secret, verifier_or_pin)
      request_token = ::OAuth::RequestToken.new(signing_consumer, request_token, request_secret)
      access_token = request_token.get_access_token(:oauth_verifier => verifier_or_pin)
      @access_token, @access_secret = access_token.token, access_token.secret
    end
    
    def access_token
      @access_token ||= ::OAuth::AccessToken.new(signing_consumer, @access_token, @access_secret)
    end
    
    private
    
    def clear_request_token
      @request_token = nil
    end
    
  end
end
