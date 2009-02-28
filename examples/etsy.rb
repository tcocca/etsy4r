require File.dirname(__FILE__) + '/../lib/etsy4r'
require 'yaml'

client = Etsy4r::Client.new('dacmw5zgq4x82z95ben5em6v')

server = Etsy4r::ServerCommands.new(client)
#resp = server.ping
#resp = server.get_method_table
#resp = server.get_server_epoch
#puts Time.at(resp.results.first).to_yaml

gift_guide = Etsy4r::GiftGuideCommands.new(client)
#resp = gift_guide.get_gift_guides
#resp = gift_guide.get_gift_guide_listings(61, {:detail_level => "high"})

user = Etsy4r::UserCommands.new(client)
#resp = user.get_user_details(5565464)
#resp = user.get_user_details('maymaydesigns')
#resp = user.get_user_details('maymaydesigns', {:detail_level => 'high'})
resp = user.get_users_by_name('amanda', {:detail_level => 'medium', :limit => 50})

puts resp.to_yaml
