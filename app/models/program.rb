class Program < ActiveRecord::Base
  attr_accessible :name
  has_many :courses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
