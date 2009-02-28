module Etsy4r
  class TagCommands < Etsy4r::Commands
    
    def get_top_tags
      @client.process("/tags/top")
    end
    
    def get_child_tags(tag)
      tag_param = tag.gsub(/\s|\-/, "_")
      @client.process("/tags/#{tag_param}/children")
    end
    
  end
end
