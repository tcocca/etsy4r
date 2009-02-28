module Etsy4r
  class UserCommands
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def get_user_details(user_id, optional_params = {})
      options = {}
      options.merge!(optional_params) unless optional_params.blank?
      @client.process("/users/#{user_id}", options)
    end
    
    def get_users_by_name(search_name, optional_params = {})
      options = {}
      options.merge!(optional_params) unless optional_params.blank?
      @client.process("/users/keywords/#{search_name}", options)
    end
    
  end
end
