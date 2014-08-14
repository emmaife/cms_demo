class Restaurant < ActiveRecord::Base
  has_one :location, as: :business

  has_many :menus, :dependent => :destroy

end
