module Etsy4r
  class ListingCommands < Etsy4r::Commands
    
    def get_listing_details(listing_id, optional_params = {})
      @client.process("/listings/#{listing_id}", optional_params)
    end
    
    def get_listings_by_tags(tags, optional_params = {})
      tag_params = tags.collect{|t| t.gsub(" ", "_")}
      tag_param = tag_params.join(';')
      @client.process("/listings/tags/#{tag_param}", optional_params)
    end
    
    def get_listings_by_keywords(keywords, optional_params = {})
      keyword_params = keywords.collect{|k| k.gsub(" ", "_")}
      keyword_param = keyword_params.join(';')
      @client.process("/listings/keywords/#{keyword_param}", optional_params)
    end
    
    def get_front_featured_listings(optional_params = {})
      @client.process("/listings/featured/front", optional_params)
    end
    
    def get_all_listings(optional_params = {})
      @client.process("/listings/all", optional_params)
    end
    
    def get_listings_by_category(category, optional_params = {})
      cat_param = category.gsub(/\s|\-/, "_")
      @client.process("/listings/category/#{cat_param}", optional_params)
    end
    
    def get_listings_by_color(color, optional_params = {})
      color_param = color.gsub("#", "")
      @client.process("/listings/color/#{color_param}", optional_params)
    end
    
    def get_listings_by_color_and_keywords(color, keywords, optional_params = {})
      color_param = color.gsub("#", "")
      keyword_params = keywords.collect{|k| k.gsub(" ", "_")}
      search_terms = keyword_params.join(';')
      @client.process("/listings/color/#{color_param}/keywords/#{search_terms}", optional_params)
    end
    
    def get_listings_by_materials(materials, optional_params = {})
      material_params = materials.collect{|t| t.gsub(" ", "_")}
      material_param = material_params.join(';')
      @client.process("/listings/materials/#{material_param}", optional_params)
    end
    
  end
end
