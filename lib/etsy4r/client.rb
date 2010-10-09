module Etsy4r
  class Client
    
    include HTTParty
    base_uri 'openapi.etsy.com/v2/sandbox/public'
    format :json
    
    def initialize(apikey)
      self.class.default_params :api_key => apikey
    end
    
    def process_get(uri, optional_params = {})
      Response.new(self.class.get(uri, :query => optional_params))
    end
    
  end
end
