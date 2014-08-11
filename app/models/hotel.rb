class Hotel < ActiveRecord::Base
  has_one :location, as: :business
end
