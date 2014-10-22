class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name, :city, :country
  has_event_calendar
  has_many :courses
  has_many :bookings, dependent: :destroy


  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :city, presence: true
  validates :country, presence: true

  scope :created_today, where("classroom.bookings.start_at >= :start_date AND end_at <= :end_date",
  {start_date: Time.now.midnight - 1.days, end_date: Time.now.midnight})

  def city_room
    "#{city} - #{name}"
  end
end
