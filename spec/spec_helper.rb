begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'etsy4r'

module Etsy4rSpecHelper
  
  def etsy4r_client
    Etsy4r::Client.new('dacmw5zgq4x82z95ben5em6v')
  end
  
end


module Etsy4rImageParserSpecHelper
  
  def test_image_hash
    {
      "0" => {
        "image_url_430xN" => "http://ny-image2.etsy.com/il_430xN.53071410.jpg",
        "image_url_200x200" => "http://ny-image2.etsy.com/il_200x200.53071410.jpg",
        "image_url_155x125" => "http://ny-image2.etsy.com/il_155x125.53071410.jpg",
        "image_url_75x75" => "http://ny-image2.etsy.com/il_75x75.53071410.jpg",
        "image_url_50x50" => "http://ny-image2.etsy.com/il_50x50.53071410.jpg",
        "image_url_25x25" => "http://ny-image2.etsy.com/il_25x25.53071410.jpg"
      },
      "1" => {
        "image_url_430xN" => "http://ny-image2.etsy.com/il_430xN.53071678.jpg",
        "image_url_200x200" => "http://ny-image2.etsy.com/il_200x200.53071678.jpg",
        "image_url_155x125" => "http://ny-image2.etsy.com/il_155x125.53071678.jpg",
        "image_url_75x75" => "http://ny-image2.etsy.com/il_75x75.53071678.jpg",
        "image_url_50x50" => "http://ny-image2.etsy.com/il_50x50.53071678.jpg",
        "image_url_25x25" => "http://ny-image2.etsy.com/il_25x25.53071678.jpg"
      },
      "2" => {
        "image_url_430xN" => "http://ny-image0.etsy.com/il_430xN.53498548.jpg",
        "image_url_200x200" => "http://ny-image0.etsy.com/il_200x200.53498548.jpg",
        "image_url_155x125" => "http://ny-image0.etsy.com/il_155x125.53498548.jpg",
        "image_url_75x75" => "http://ny-image0.etsy.com/il_75x75.53498548.jpg",
        "image_url_50x50" => "http://ny-image0.etsy.com/il_50x50.53498548.jpg",
        "image_url_25x25" => "http://ny-image0.etsy.com/il_25x25.53498548.jpg"
      },
      "3" => {
        "image_url_430xN" => "http://ny-image1.etsy.com/il_430xN.53498749.jpg",
        "image_url_200x200" => "http://ny-image1.etsy.com/il_200x200.53498749.jpg",
        "image_url_155x125" => "http://ny-image1.etsy.com/il_155x125.53498749.jpg",
        "image_url_75x75" => "http://ny-image1.etsy.com/il_75x75.53498749.jpg",
        "image_url_50x50" => "http://ny-image1.etsy.com/il_50x50.53498749.jpg",
        "image_url_25x25" => "http://ny-image1.etsy.com/il_25x25.53498749.jpg"
      },
      "4" => {
        "image_url_430xN" => "http://ny-image1.etsy.com/il_430xN.62643641.jpg",
        "image_url_200x200" => "http://ny-image1.etsy.com/il_200x200.62643641.jpg",
        "image_url_155x125" => "http://ny-image1.etsy.com/il_155x125.62643641.jpg",
        "image_url_75x75" => "http://ny-image1.etsy.com/il_75x75.62643641.jpg",
        "image_url_50x50" => "http://ny-image1.etsy.com/il_50x50.62643641.jpg",
        "image_url_25x25" => "http://ny-image1.etsy.com/il_25x25.62643641.jpg"
      }
    }
  end
  
end
