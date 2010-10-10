module Etsy4r
  class Treasury < Etsy4r::Command
    
    def find_all_treasuries(optional_params = {})
      @client.process_get('/treasuries', optional_params)
    end
    
    def get_treasury(treasury_id)
      @client.process_get("/treasuries/#{treasury_id}")
    end
    
  end
end
