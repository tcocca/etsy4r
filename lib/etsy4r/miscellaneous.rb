module Etsy4r
  class Miscellaneous < Etsy4r::Command
    
    def find_all_country
      @client.process_get('/countries')
    end
    
    def get_country(country_ids)
      country_param = country_ids.is_a?(Array) ? country_ids.join(',') : country_ids
      @client.process_get("/countries/#{country_param}")
    end
    
    def find_all_region
      @client.process_get('/regions')
    end
    
    def get_region(region_ids)
      region_param = region_ids.is_a?(Array) ? region_ids.join(',') : region_ids
      @client.process_get("/regions/#{region_param}")
    end
    
  end
end
