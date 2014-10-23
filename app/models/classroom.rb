class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name, :city, :country
  has_event_calendar
  has_many :courses
  has_many :bookings, dependent: :destroy

  # before_save :ensure_uniqueness_of_city_room
  # validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :city, presence: true
  validates :country, presence: true

  scope :created_today, where("classroom.bookings.start_at >= :start_date AND end_at <= :end_date",
  {start_date: Time.now.midnight - 1.days, end_date: Time.now.midnight})

  def ensure_uniqueness_of_city_room
    # iterate over all the records,
    # dynamically create the value of city_room 
    # and push it inside an array,
    # for each record, make sure that the value of the current city room doesnt already exists in the array,
    # if it does, then update one of the fields, (city or name)
    # or add an error to self.errors[:base]
  end

  def room_name(city)
    "#{city}: Room #{Classroom.where(city: city).count + 1 }"
  end
  
  
end
