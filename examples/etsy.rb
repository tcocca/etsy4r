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
res = shop.get_featured_details('maymaydesigns', :detail_level => 'high')

puts res.to_yaml
