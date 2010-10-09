module Etsy4r
  class User < Etsy4r::Command
    
    def get_user_details(user_id, optional_params = {})
      @client.process_get("/users/#{user_id}", optional_params)
    end
    
    def get_users_by_name(search_name, optional_params = {})
      search_name_param = search_name.gsub(" ", "_")
      @client.process_get("/users/keywords/#{search_name_param}", optional_params)
    end
    
  end
end
