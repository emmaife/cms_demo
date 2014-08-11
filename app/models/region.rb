class Region < ActiveRecord::Base
  belongs_to :business_group
  # belongs_to :business, polymorphic: true
end
