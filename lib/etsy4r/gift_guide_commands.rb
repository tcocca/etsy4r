module Etsy4r
  class GiftGuideCommands
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def get_gift_guides
      @client.process('/gift-guides')
    end
    
    def get_gift_guide_listings(guide_id, optional_params = {})
      @client.process("/gift-guides/#{guide_id}/listings", optional_params)
    end
    
  end
end
