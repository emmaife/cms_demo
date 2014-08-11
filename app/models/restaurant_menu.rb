class RestaurantMenu < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu

  has_many :restaurant_menu_categories
  has_many :menu_categories, through: :restaurant_menu_categories

  has_many :restaurant_menu_items, through: :restaurant_menu_categories
end
