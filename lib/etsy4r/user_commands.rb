module Etsy4r
  class UserCommands
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def get_user_details(user_id, optional_params = {})
      @client.process("/users/#{user_id}", optional_params)
    end
    
    def get_users_by_name(search_name, optional_params = {})
      @client.process("/users/keywords/#{search_name}", optional_params)
    end
    
  end
end
