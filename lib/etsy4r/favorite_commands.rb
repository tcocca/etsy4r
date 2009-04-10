module Etsy4r
  class FavoriteCommands < Etsy4r::Commands
    
    def get_favorers_of_shop(user_id, optional_params = {})
      @client.process("/shops/#{user_id}/favorers", optional_params)
    end
    
    def get_favorers_of_listing(listing_id, optional_params = {})
      @client.process("/listings/#{listing_id}/favorers", optional_params)
    end
    
    def get_favorite_shops_of_user(user_id, optional_params = {})
      @client.process("/users/#{user_id}/favorites/shops", optional_params)
    end
    
    def get_favorite_listings_of_user(user_id, optional_params = {})
      @client.process("/users/#{user_id}/favorites/listings", optional_params)
    end
    
  end
end
