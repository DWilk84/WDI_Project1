class Course < ActiveRecord::Base
  attr_accessible :end_date, :name, :program_id, :start_date
end
