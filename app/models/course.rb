class Course < ActiveRecord::Base
  attr_accessible :code, :start_date, :end_date, :program_id, :classroom_id, :color, :user_ids

  belongs_to :program
  belongs_to :classroom
  has_one :booking, dependent: :destroy
  has_and_belongs_to_many :users

  def course_code(course)
    "#{course.program.code}-#{Course.where(program_id: program_id).count + 1 }"
  end

end
