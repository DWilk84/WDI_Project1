# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Classroom.delete_all
Program.delete_all
Course.delete_all

# Classrooms

# 3.times do |num|
#   Classroom.create!(name: "Room #{num+1}", capacity: 20, city: "London", country: "England")
#   Classroom.create!(name: "Room #{num+1}", capacity: 15, city: "New York", country: "USA")
# end

c1 = Classroom.create!(name: "Room 1", capacity: 20, city: "London", country: "England")
c2 = Classroom.create!(name: "Room 2", capacity: 20, city: "London", country: "England")

# Programs

p1 = Program.create!(name: "Product Management Immersive")
p2 = Program.create!(name: "Sales & Business Development Immersive")
p3 = Program.create!(name: "User Experience Design Immersive")
p4 = Program.create!(name: "Web Development Immersive")

# Courses

sd = Date.new(2014, 11, 1)
ed = sd + 81.days

3.times do |num|
  Course.create!(code: "PMI-#{num + 1}", start_date: sd + (num * 12).weeks, end_date: ed + (num * 12).weeks, program_id: p1.id, classroom_id: c1.id)
  Course.create!(code: "SBDI-#{num + 1}", start_date: sd + (num * 12).weeks, end_date: ed + (num * 12).weeks, program_id: p2.id, classroom_id: c1.id)
  Course.create!(code: "UXDI-#{num + 1}", start_date: sd + (num * 12).weeks, end_date: ed + (num * 12).weeks, program_id: p3.id, classroom_id: c2.id)
  Course.create!(code: "WDI-#{num + 1}", start_date: sd + (num * 12).weeks, end_date: ed + (num * 12).weeks, program_id: p4.id, classroom_id: c2.id)
end




