module Etsy4r
  class Shop < Etsy4r::Command
    
    def get_shop_details(user_id, optional_params = {})
      @client.process_get("/shops/#{user_id}", optional_params)
    end
    
    def get_featured_sellers(optional_params = {})
      @client.process_get("/shops/featured", optional_params)
    end
    
    def get_shop_listings(user_id, optional_params = {})
      @client.process_get("/shops/#{user_id}/listings", optional_params)
    end
    
    def get_shops_by_name(search_name, optional_params = {})
      search_name_param = search_name.gsub(" ", "_")
      @client.process_get("/shops/keywords/#{search_name_param}", optional_params)
    end
    
    def get_featured_details(user_id, optional_params = {})
      @client.process_get("/shops/#{user_id}/listings/featured", optional_params)
    end
    
  end
end
