module Etsy4r
  class ShopCommands
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def get_shop_details(user_id, optional_params = {})
      @client.process("/shops/#{user_id}", optional_params)
    end
    
    def get_featured_sellers(optional_params = {})
      @client.process("/shops/#{user_id}", optional_params)
    end
        
  end
end
