class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :location_id, :name

  belongs_to :location
  has_many :bookings
  has_many :courses, through: :bookings
end
