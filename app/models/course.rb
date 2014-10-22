class Course < ActiveRecord::Base
  attr_accessible :code, :start_date, :end_date, :program_id, :classroom_id, :color #, :bookings_attributes, :classroom_ids

  belongs_to :program
  belongs_to :classroom
  has_one :booking, dependent: :destroy

  # has_many :bookings
  # has_many :classrooms, through: :bookings
  # accepts_nested_attributes_for :booking

  validates :code, presence: true, uniqueness: true

end
