# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.destroy_all
Classroom.delete_all

# Locations

l1 = Location.create!(name: "GA London @ White Bear Yard", city: "London", country: "England", full_address: "GA London @ White Bear Yard, 9 Back Hill, 4th Floor, London, EC1R 5EN")

l2 = Location.create!(name: "GA New York City (West)", city: "New York", country: "USA", full_address: "GA New York City (West), 10 East 21st Street, 4th Floor, New York, 10010")

# Classrooms
3.times do |num|
  Classroom.create!(name: "Room #{num+1}", capacity: 20, location_id: l1.id)
  Classroom.create!(name: "Room #{num+1}", capacity: 15, location_id: l2.id)
end


