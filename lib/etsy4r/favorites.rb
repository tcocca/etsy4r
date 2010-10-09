module Etsy4r
  class Favorites < Etsy4r::Command
    
    def get_favorers_of_shop(user_id, optional_params = {})
      @client.process_get("/shops/#{user_id}/favorers", optional_params)
    end
    
    def get_favorers_of_listing(listing_id, optional_params = {})
      @client.process_get("/listings/#{listing_id}/favorers", optional_params)
    end
    
    def get_favorite_shops_of_user(user_id, optional_params = {})
      @client.process_get("/users/#{user_id}/favorites/shops", optional_params)
    end
    
    def get_favorite_listings_of_user(user_id, optional_params = {})
      @client.process_get("/users/#{user_id}/favorites/listings", optional_params)
    end
    
  end
end
