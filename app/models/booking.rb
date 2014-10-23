class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :course_id, :start_at, :end_at, :color, :name

  has_event_calendar

  belongs_to :course
  belongs_to :classroom

  # scope :booked, where("bookings.created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})

  # scope :booked, where("bookings.start_at >= :start_date AND end_at <= :end_date",
  # {start_date: Date.new(2015), end_date: Date.new(2015, 5)})


end
