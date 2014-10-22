class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :course_ids

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false}

  has_many :admissions
  has_many :courses, through: :admissions

end
