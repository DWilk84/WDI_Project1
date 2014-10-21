class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name, :city, :country

  has_many :courses
  has_many :bookings
  # has_many :courses, through: :bookings


  def city_room
    "#{city} - #{name}"
    
  end
end
