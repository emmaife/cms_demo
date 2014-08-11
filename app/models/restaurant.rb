class Restaurant < ActiveRecord::Base
  has_one :location, as: :business

  has_many :restaurant_menus
  has_many :menus, through: :restaurant_menus

  has_many :restaurant_menu_items, through: :restaurant_menus

end
