class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menu_categories, :dependent => :destroy
  has_many :menu_items, through: :menu_categories, :dependent => :destroy

  def name_with_restaurant
    "#{name} - #{self.restaurant.name}" 
  end
end
