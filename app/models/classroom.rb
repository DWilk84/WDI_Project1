class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name, :city, :country
  has_event_calendar
  has_many :courses
  has_many :bookings
  # has_many :courses, through: :bookings

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :city, presence: true
  validates :country, presence: true


  def city_room
    "#{city} - #{name}"
  end
end
