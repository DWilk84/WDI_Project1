class Location < ActiveRecord::Base
  attr_accessible :city, :country, :full_address, :name

  has_many :classrooms, dependent: :destroy
end
