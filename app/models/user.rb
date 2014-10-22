class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :course_ids

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false}

  has_and_belongs_to_many :courses

end
