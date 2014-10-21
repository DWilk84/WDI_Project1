class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :course_id, :starts_at, :ends_at

  belongs_to :classroom
  belongs_to :course

end
