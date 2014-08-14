class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  has_many :menu_item_prices, :dependent => :destroy
end
