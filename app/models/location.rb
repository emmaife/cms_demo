class Location < ActiveRecord::Base
  belongs_to :region
  belongs_to :business_group
  belongs_to :business, polymorphic: true
  

end
