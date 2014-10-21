class Course < ActiveRecord::Base
  attr_accessible :code, :start_date, :end_date, :program_id, :classroom_id #:bookings_attributes, :classroom_ids

  belongs_to :program
  belongs_to :classroom
  # has_many :bookings
  # has_many :classrooms, through: :bookings
  # accepts_nested_attributes_for :bookings
end
