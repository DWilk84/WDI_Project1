# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.delete_all
Classroom.delete_all
Program.delete_all
Course.delete_all

# Locations

l1 = Location.create!(name: "GA London @ White Bear Yard", city: "London", country: "England", full_address: "GA London @ White Bear Yard, 9 Back Hill, 4th Floor, London, EC1R 5EN")

l2 = Location.create!(name: "GA New York City (West)", city: "New York", country: "USA", full_address: "GA New York City (West), 10 East 21st Street, 4th Floor, New York, 10010")

# Classrooms

3.times do |num|
  Classroom.create!(name: "Room #{num+1}", capacity: 20, location_id: l1.id)
  Classroom.create!(name: "Room #{num+1}", capacity: 15, location_id: l2.id)
end

# Programs

p1 = Program.create!(name: "Product Management Immersive")
p2 = Program.create!(name: "Sales & Business Development Immersive")
p3 = Program.create!(name: "User Experience Design Immersive")
p4 = Program.create!(name: "Web Development Immersive")

# Courses

sd = Date.new(2014, 11, 1)
ed = sd + 81.days

3.times do |num|
  Course.create!(name: "PMI-#{num}", start_date: sd >> (num * 12).weeks, end_date: ed >> (num * 12).weeks, program_id: p1.id)
  Course.create!(name: "SBDI-#{num}", start_date: sd >> (num * 12).weeks, end_date: ed >> (num * 12).weeks, program_id: p2.id)
  Course.create!(name: "UXDI-#{num}", start_date: sd >> (num * 12).weeks, end_date: ed >> (num * 12).weeks, program_id: p3.id)
  Course.create!(name: "WDI-#{num}", start_date: sd >> (num * 12).weeks, end_date: ed >> (num * 12).weeks, program_id: p4.id)
end




