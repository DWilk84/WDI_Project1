class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :course_id, :start_at, :end_at, :color

  has_event_calendar
end
