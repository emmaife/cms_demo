class MenuCategory < ActiveRecord::Base
  belongs_to :menu
  has_many :menu_items, :dependent => :destroy

  def name_with_details
    "#{self.menu.name} - #{name} - #{self.menu.restaurant.name}"
  end
  
end
