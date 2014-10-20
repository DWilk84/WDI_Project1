class Course < ActiveRecord::Base
  attr_accessible :end_date, :name, :program_id, :start_date, :bookings_attributes, :classroom_ids

  belongs_to :program
  has_many :bookings
  has_many :classrooms, through: :bookings
  accepts_nested_attributes_for :bookings
end
