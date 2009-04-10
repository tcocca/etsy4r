module Etsy4r
  class ImageParser
    
    attr_accessor :listing_id, :parse_url, :images
    
    def initialize(listing_id)
      @listing_id = listing_id
      @parse_url = "http://www.etsy.com/view_listing.php?listing_id=#{@listing_id}"
    end
    
    def images
      return @listing_images if @listing_images
      
      @listing_images = {}
      require 'hpricot'
      require 'open-uri'
      
      image_list = []
      doc = open(@parse_url) {|f| Hpricot(f)}
      img_table = doc.search("/html/body/table/tr/td/table/tr[2]/td/table/tr[3]/td/table/tr[2]/td/table/tr/td[2]/table")
      img_table.first.search('img').each do |img|
        image_list << img.attributes['src']
      end
      image_list.each_with_index do |img_url, i|
        img_dom = /\/\/(\S*)\//.match(img_url)[1]
        img_id = /\.([\d]*)\./.match(img_url)[1]
        @listing_images["#{i}"] = {
          "image_url_430xN" => "http://#{img_dom}/il_430xN.#{img_id}.jpg",
          "image_url_200x200" => "http://#{img_dom}/il_200x200.#{img_id}.jpg",
          "image_url_155x125" => "http://#{img_dom}/il_155x125.#{img_id}.jpg",
          "image_url_75x75" => "http://#{img_dom}/il_75x75.#{img_id}.jpg",
          "image_url_50x50" => "http://#{img_dom}/il_50x50.#{img_id}.jpg",
          "image_url_25x25" => "http://#{img_dom}/il_25x25.#{img_id}.jpg"
        }
      end
      return @listing_images
    end
    
  end
end
