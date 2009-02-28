module Etsy4r
  class Client
    
    include HTTParty
    base_uri 'beta-api.etsy.com/v1'
    format :json
    
    def initialize(apikey)
      self.class.default_params :api_key => apikey
    end
    
    def process(uri, options = {})
      Response.new(self.class.get(uri, :query => options))
    end
    
  end
end
