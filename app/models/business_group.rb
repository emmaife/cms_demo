class BusinessGroup < ActiveRecord::Base
  belongs_to :organization
  has_many :regions
  has_many :locations, through: :regions
end
