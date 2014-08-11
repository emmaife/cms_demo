class Menu < ActiveRecord::Base
  has_many :restaurant_menus
  has_many :restaurants, through: :restaurant_menus

  # has_many :menu_categories


end
