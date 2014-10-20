class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :course_id

  belongs_to :classroom
  belongs_to :course

end
