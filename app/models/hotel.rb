class Hotel < ActiveRecord::Base
  has_one :location, as: :business, :inverse_of => :business
end
