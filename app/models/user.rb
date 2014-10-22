class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false}

end
