class Course < ActiveRecord::Base
  attr_accessible :code, :start_date, :end_date, :program_id, :classroom_id, :color, :user_ids, :admissions_attributes

  belongs_to :program
  belongs_to :classroom
  has_one :booking, dependent: :destroy
  
  has_many :admissions, dependent: :destroy
  has_many :users, through: :admissions

  accepts_nested_attributes_for :admissions

  def course_code(course)
    "#{course.program.code}-#{Course.where(program_id: program_id).count + 1 }"
  end

  # this one doesn't work!!
  # scope :overlapping, lambda { |course| {
    # :conditions => ["id <> ? AND (DATEDIFF(start_date, ?) * DATEDIFF(?, end_date)) >= 0", course.id, course.end_date, course.start_date]
    # }}

  # this one does work!
  scope :overlapping, lambda { |course|
    s = course['start_date']
    e = course['end_date']
    query = <<-SQL
    SELECT DISTINCT "courses".* FROM "courses"
    WHERE (end_date BETWEEN '#{s}' AND '#{e}')
    OR (start_date BETWEEN '#{s}' AND '#{e}')
    OR ((start_date < '#{s}') AND (end_date > '#{e}'))
    SQL

    find_by_sql(query)
  }

  scope :upcoming_courses, Course.where("start_date > :start_date",  {start_date: DateTime.now}).order("start_date, code")
  scope :completed_courses, Course.where("end_date < :start_date",  {start_date: DateTime.now}).order("start_date, code")
  scope :ongoing_courses, where("start_date < :start_date AND end_date > :start_date",  {start_date: DateTime.now}).order("start_date, code")

  def self.cities
    Course.all.map {|course| course.classroom.city}.uniq.sort
  end
end
