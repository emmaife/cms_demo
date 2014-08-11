class RestaurantMenuItem < ActiveRecord::Base
  has_many :restaurant_menu_categories
  has_many :restaurant_menus, through: :restaurant_menu_category
end
