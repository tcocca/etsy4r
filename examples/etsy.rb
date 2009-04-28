require File.dirname(__FILE__) + '/../lib/etsy4r'
require 'yaml'

# Read the Etsy API Documentation
# http://developer.etsy.com/docs


# Initialize a new Etsy API Client
#client = Etsy4r::Client.new('your_api_key')
client = Etsy4r::Client.new('dacmw5zgq4x82z95ben5em6v')


# Initialize a ServerCommands object
server = Etsy4r::ServerCommands.new(client)

# Ping the server
res = server.ping

# Return a list of all available method calls
res = server.get_method_table

# Get the current time on the Etsy server in epoch
res = server.get_server_epoch

# Go from epoch time to ruby Time object
puts Time.at(res.results.first)


# Every call return a response object
# Below are the following methods on that object
# These methods are available on every single call except on the image parser object
if res.success?
  puts res.body .to_yaml    # Return the full body response of the call
  puts res.results.to_yaml  # Return the results (the actual data) in an array of hashes
  puts res.count            # Count of all pieces of data that the Query returned (note: this is a total count not the count returned)
  puts res.type             # The type of result passed back
  puts res.params           # The params passed in to the query  
else
  puts res.error_message  # If the call was not successful an error message is returned
end


# Initialize a GiftGuideCommands object
gift_guide = Etsy4r::GiftGuideCommands.new(client)

# Get a list of available GiftGuides
res = gift_guide.get_gift_guides

# Get the listings for a gift guide
# The first params is the id of the gift guide
# This method takes the following optional params
#  :offset 	default = 0 type = int
#  :limit 	  default = 10 type = int, max = 50
#  :detail_level 	default = 'low' 	options = enum(low, medium, high)
res = gift_guide.get_gift_guide_listings(61, {:detail_level => "high"})


# Initialize a UserCommands object
user = Etsy4r::UserCommands.new(client)

# Return the details for a user
# You can pass a user id:
res = user.get_user_details(5565464)
# Or a user_name
res = user.get_user_details('maymaydesigns')
# Also, this methods take the :detail_level optional param
res = user.get_user_details('maymaydesigns', {:detail_level => 'high'})

# Search for users by name
# The search name is required
# The method takes the :detail_level, :limit and :offset optional params
res = user.get_users_by_name('amanda', {:detail_level => 'medium', :limit => 50})


# Initialize a ShopCommands object
shop = Etsy4r::ShopCommands.new(client)

# Get shop details, this method takes either a user_id or user_name
# Also takes the :detail_level optional params
res = shop.get_shop_details(5565464)
res = shop.get_shop_details('maymaydesigns')

# Returns a list of featured selers, not params
res = shop.get_featured_sellers

# Returns all listings for a "shop" (or user)
# Takes either a user_id or a user_name
# Optional Params
#   :detail_level, :limit, :offset, 
#   :sort_order   enum(up, down)
#   :sort_on      enum(created, price)
#   section_id    int
res = shop.get_shop_listings(5565464)
res = shop.get_shop_listings('maymaydesigns')

# Search for shops be a name
# The name params is required
# Take the following optional params
#  :detail_level, :limit, :offset
#  :sort_order   default => 'down'  enum (down, up)
res = shop.get_shops_by_name('amanda')

# Get a shops feauted listings
# Takes either a user_id or user_name
# Also taks the :detail_level optional_param
res = shop.get_featured_details(5565464)
res = shop.get_featured_details('maymaydesigns', :detail_level => 'high')


# Initialize a TagCommands object
tag = Etsy4r::TagCommands.new(client)

# Returns the top level tags, no params
res = tag.get_top_tags

# Returns the child tags of a tag
# Spaces and dashes get converted to underscores
res = tag.get_child_tags('bags-and-purses')
res = tag.get_child_tags('bags and purses')
res = tag.get_child_tags('bags_and_purses')


# Initialize a CategoryCommands object
tag = Etsy4r::CategoryCommands.new(client)

# Returns the top level categories, no params
res = tag.get_top_categories

# Returns the child categories of a category
# Spaces and dashes get converted to underscores
res = tag.get_child_categories('bags-and-purses')
res = tag.get_child_categories('bags and purses')
res = tag.get_child_categories('bags_and_purses')


# Initialiaze a ListingCommands object
listing = Etsy4r::ListingCommands.new(client)

# Returns details for a specific listing
# Takes the listing_id as a params and the optional :detail_level param
res = listing.get_listing_details(19781773, :detail_level => 'high')

# Returns listings that match the tags
# Pass tags in as an array
# Takes the following optional params
#  :sort_on   default => 'created' 	enum(created, price)
#  :sort_order   detfault => 'down' 	enum(up, down)
#  :detail_level, :limit, :offset
res = listing.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'])
res = listing.get_listings_by_tags(['bags_and_purses', 'art', 'shoulder bag'], :sort_on => 'price', :sort_order => 'down')

# Return listings that match keywords
# Takes an array of keywords
# Takes the following optional params
#  :min_price 	default => NULL 	type = float
#  :max_price 	default => NULL 	type = float
#  :search_description 	default => false 	enum(true, false)
#  :sort_order, :sort_on, :detail_level, :limit, :offset
res = listing.get_listings_by_keywords(['bags and purses', 'art', 'shoulder bag'])
res = listing.get_listings_by_keywords(['bags and purses', 'art', 'shoulder bag'], :min_price => 0, :max_price => 22.99)

# Returns the list of listings featured on the etsy homepage
# No required params
# Optional params
#  :detail_level, :limit, :offset
res = listing.get_front_featured_listings
res = listing.get_front_featured_listings(:detail_level => 'medium', :limit => '45')

# Returns all listings
# No required params
# Optional params
#  :detail_level, :limit, :offset, :sort_on, :sort_order
res = listing.get_all_listings
res = listing.get_all_listings(:detail_level => 'medium', :limit => 45, :offset => 45, :sort_on => 'ending', :sort_order => 'down')

# Returns all listings in a category
# category is required
# Optional params
#  :detail_level, :limit, :offset, :sort_on, :sort_order
res = listing.get_listings_by_category('bags_and_purses')
res = listing.get_listings_by_category('bags_and_purses', :detail_level => 'medium', :limit => 15, :offset => 15, :sort_on => 'price', :sort_order => 'down')

# Returns all listings matching a color
# color is required
# HSV color as an array (0;0;0 through 360;100;100) or an RGB color in web notation (#000000 through #FFFFFF.) 
#  NOTE: The Etsy API uses HSV colors internally, and the conversion from RGB to HSV is not 100% accurate.
#  (RGB colors are converted to HSV internally, which may result in small rounding errors.  They may omit the leading "#", or use the three-digit form.)
# Optional params
#  :wiggle  default => 5, type => int
#  :detail_level, :limit, :offset
res = listing.get_listings_by_color('FFFFFF')
res = listing.get_listings_by_color('#FFFFFF')
res = listing.get_listings_by_color('360;100;100', :detail_level => 'medium', :limit => 15, :offset => 15, :wiggle => 10)

# Returns all listings matching a color and search terms
# color is required (HSV or RGB)
# an array of search terms is required
# Optional params
#  :detail_level, :limit, :offset, :wiggle
res = listing.get_listings_by_color_and_keywords('FFFFFF', ['bags', 'bracelets'])
res = listing.get_listings_by_color_and_keywords('#FFFFFF', ['bags', 'bracelets'])
res = listing.get_listings_by_color_and_keywords('360;100;100', ['bags', 'bracelets'], :detail_level => 'medium', :wiggle => 10)


# Initialize a FavoriteCommands object
favorite = Etsy4r::FavoriteCommands.new(client)

# Returns the users who favorited the user passed in
# Takes either a user_id or user_name
# Optional params
#  :detail_level, :limit, :offset
res = favorite.get_favorers_of_shop(5565464)
res = favorite.get_favorers_of_shop(5565464, :detail_level => 'high', :limit => 5, :offset => 5)

# Returns the users who favorited the listing passed in
# Takes a listing_id
# Optional params
#  :detail_level, :limit, :offset
res = favorite.get_favorers_of_listing(19749826)
res = favorite.get_favorers_of_listing(19749826, :detail_level => 'high', :limit => 5, :offset => 5)

# Returns the users who the user passed in favorited
# Takes either a user_id or user_name
# Optional params
#  :detail_level, :limit, :offset
res = favorite.get_favorite_shops_of_user(5565464)
res = favorite.get_favorite_shops_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)

# Returns the listings who the user passed in favorited
# Takes either a user_id or user_name
# Optional params
#  :detail_level, :limit, :offset
res = favorite.get_favorite_listings_of_user(5565464)
res = favorite.get_favorite_listings_of_user(5565464, :detail_level => 'high', :limit => 5, :offset => 5)


# Initialize a FeedbackCommands object
feedback = Etsy4r::FeedbackCommands.new(client)

# Returns the top level tags, no params
res = feedback.get_feedback(17331973)

# Returns all feedback for a user
# Takes either a user_id or user_name
# Optional params
#  :limit, :offset
res = feedback.get_feedback_for_user(5565464)
res = feedback.get_feedback_for_user('maymaydesigns')

# Returns all feedback where the user was the buyer
# Takes either a user_id or user_name
# Optional params
#  :limit, :offset
res = feedback.get_feedback_as_buyer(5565464)
res = feedback.get_feedback_as_buyer('maymaydesigns')

# Returns all feedback where the user left feedback
# Takes either a user_id or user_name
# Optional params
#  :limit, :offset
res = feedback.get_feedback_for_others(5565464)
res = feedback.get_feedback_for_others('maymaydesigns')

# Returns all feedback where the user was the seller
# Takes either a user_id or user_name
# Optional params
#  :limit, :offset
res = feedback.get_feedback_as_seller(5565464)
res = feedback.get_feedback_as_seller('maymaydesigns')
