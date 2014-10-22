class Program < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
