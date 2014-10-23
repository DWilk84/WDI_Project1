class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :course_ids, :user_image, :remote_user_image_url, :role #role for seeding only!! hash out once seeded! 

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false}, on: :create

  has_many :admissions
  has_many :courses, through: :admissions

  mount_uploader :user_image, UserImageUploader

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
end
