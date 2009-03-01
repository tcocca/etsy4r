require File.dirname(__FILE__) + '/../lib/etsy4r'
require 'yaml'

client = Etsy4r::Client.new('dacmw5zgq4x82z95ben5em6v')

server = Etsy4r::ServerCommands.new(client)
#res = server.ping
#res = server.get_method_table
#res = server.get_server_epoch
#puts Time.at(res.results.first).to_yaml

gift_guide = Etsy4r::GiftGuideCommands.new(client)
#res = gift_guide.get_gift_guides
#res = gift_guide.get_gift_guide_listings(61, {:detail_level => "high"})

user = Etsy4r::UserCommands.new(client)
#res = user.get_user_details(5565464)
#res = user.get_user_details('maymaydesigns')
#res = user.get_user_details('maymaydesigns', {:detail_level => 'high'})
#res = user.get_users_by_name('amanda', {:detail_level => 'medium', :limit => 50})

shop = Etsy4r::ShopCommands.new(client)
#res = shop.get_shop_details(5565464)
#res = shop.get_shop_details('maymaydesigns')
#res = shop.get_featured_sellers
#res = shop.get_listings(5565464)
#res = shop.get_listings('maymaydesigns')
#res = shop.get_shops_by_name('amanda')
#res = shop.get_featured_details(5565464)
#res = shop.get_featured_details('maymaydesigns', :detail_level => 'high')

tag = Etsy4r::TagCommands.new(client)
#res = tag.get_top_tags
#res = tag.get_child_tags('bags-and-purses')
#res = tag.get_child_tags('bags and purses')
#res = tag.get_child_tags('bags_and_purses')

listing = Etsy4r::ListingCommands.new(client)
#res = listing.get_listing_details(19781773, :detail_level => 'high')
#res = listing.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'])
#res = listing.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'], :sort_on => 'price', :sort_order => 'down')
#res = listing.get_listings_by_keywords(['bags and purses', 'art', 'shoulder bag'])
#res = listing.get_listings_by_keywords(['bags and purses', 'art', 'shoulder bag'], :min_price => 0, :max_price => 22.99)
#res = listing.get_front_featured_listings
#res = listing.get_front_featured_listings(:detail_level => 'medium', :limit => '45')

favorite = Etsy4r::FavoriteCommands.new(client)
#res = favorite.get_favorers_of_user(5565464)
#res = favorite.get_favorers_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)
#res = favorite.get_favorers_of_listing(19749826)
#res = favorite.get_favorers_of_listing(19749826, :detail_level => 'high', :limit => 5, :offset => 5)
#res = favorite.get_favorite_shops_of_user(5565464)
#res = favorite.get_favorite_shops_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)
#res = favorite.get_favorite_listings_of_user(5565464)
#res = favorite.get_favorite_listings_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)

#puts res.to_yaml


image_parser = Etsy4r::ImageParser.new(19781773)
puts image_parser.images.to_yaml
