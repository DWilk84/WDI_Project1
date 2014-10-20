class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :location_id, :name
end
