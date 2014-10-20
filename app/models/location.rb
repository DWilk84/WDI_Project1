class Location < ActiveRecord::Base
  attr_accessible :city, :country, :full_address, :name
end
