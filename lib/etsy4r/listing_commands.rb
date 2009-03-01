module Etsy4r
  class ListingCommands < Etsy4r::Commands
    
    def get_listing_details(listing_id, optional_params = {})
      @client.process("/listings/#{listing_id}", optional_params)
    end
    
    def get_listings_by_tags(tags, optional_params = {})
      tag_params = tags.collect{|t| t.gsub(" ", "_")}
      tag_param = tag_params.join('+')
      @client.process("/listings/tags/#{tag_param}", optional_params)
    end
    
    def get_listings_by_keywords(keywords, optional_params = {})
      keyword_params = keywords.collect{|k| k.gsub(" ", "_")}
      keyword_param = keyword_params.join('+')
      @client.process("/listings/keywords/#{keyword_param}", optional_params)
    end
    
    def get_front_featured_listings(optional_params = {})
      @client.process("/listings/featured/front", optional_params)
    end
    
  end
end
