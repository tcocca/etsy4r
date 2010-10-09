module Etsy4r
  class Listing < Etsy4r::Command
    
    def get_listing_details(listing_id, optional_params = {})
      @client.process_get("/listings/#{listing_id}", optional_params)
    end
    
    def get_listings_by_tags(tags, optional_params = {})
      tag_params = tags.collect{|t| t.gsub(" ", "_")}
      tag_param = tag_params.join(';')
      @client.process_get("/listings/tags/#{tag_param}", optional_params)
    end
    
    def get_listings_by_keywords(keywords, optional_params = {})
      keyword_params = keywords.collect{|k| k.gsub(" ", "_")}
      keyword_param = keyword_params.join(';')
      @client.process_get("/listings/keywords/#{keyword_param}", optional_params)
    end
    
    def get_front_featured_listings(optional_params = {})
      @client.process_get("/listings/featured/front", optional_params)
    end
    
    def get_all_listings(optional_params = {})
      @client.process_get("/listings/all", optional_params)
    end
    
    def get_listings_by_category(category, optional_params = {})
      cat_param = category.gsub(/\s|\-/, "_")
      @client.process_get("/listings/category/#{cat_param}", optional_params)
    end
    
    def get_listings_by_color(color, optional_params = {})
      color_param = color.gsub("#", "")
      @client.process_get("/listings/color/#{color_param}", optional_params)
    end
    
    def get_listings_by_color_and_keywords(color, keywords, optional_params = {})
      color_param = color.gsub("#", "")
      keyword_params = keywords.collect{|k| k.gsub(" ", "_")}
      search_terms = keyword_params.join(';')
      @client.process_get("/listings/color/#{color_param}/keywords/#{search_terms}", optional_params)
    end
    
    def get_listings_by_materials(materials, optional_params = {})
      material_params = materials.collect{|t| t.gsub(" ", "_")}
      material_param = material_params.join(';')
      @client.process_get("/listings/materials/#{material_param}", optional_params)
    end
    
  end
end
