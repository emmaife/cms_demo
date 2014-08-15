class Region < ActiveRecord::Base
  has_many :locations
  belongs_to :business_group
  # belongs_to :business, polymorphic: true
end
