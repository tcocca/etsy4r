module Etsy4r
  class Homepage < Etsy4r::Command
    
    def find_all_featured_listing_picker_active(optional_params = {})
      @client.process_get('/homepages/pickers', optional_params)
    end
    
    def get_featured_listing_picker(picker_ids, optional_params = {})
      picker_param = picker_ids.is_a?(Array) ? picker_ids.join(',') : picker_ids
      @client.process_get("/homepages/pickers/#{picker_param}", optional_params)
    end
    
    def find_all_featured_listing_picker_featured(featured_listing_picker_id, optional_params = {})
      @client.process_get("/homepages/pickers/#{featured_listing_picker_id}/featured", optional_params)
    end
    
  end
end
