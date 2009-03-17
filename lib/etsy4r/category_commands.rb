module Etsy4r
  class CategoryCommands < Etsy4r::Commands
    
    def get_top_categories
      @client.process("/categories")
    end
    
    def get_child_categories(category)
      cat_param = category.gsub(/\s|\-/, "_")
      @client.process("/categories/#{cat_param}/children")
    end
    
  end
end
