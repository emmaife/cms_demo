class RestaurantMenuCategory < ActiveRecord::Base
  belongs_to :restaurant_menu
  belongs_to :menu_category

  belongs_to :restaurant_menu_items
  
end
