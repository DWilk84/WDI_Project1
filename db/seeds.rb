Classroom.delete_all
Program.delete_all
Course.delete_all

# Classrooms

r1 = Classroom.create!(name: "London: Room 1", capacity: 20, city: "London", country: "England")
r2 = Classroom.create!(name: "Berlin: Room 2", capacity: 20, city: "Berlin", country: "Germany")
r3 = Classroom.create!(name: "New York: Room 1", capacity: 15, city: "New York", country: "USA")

# Programs

p1 = Program.create!(name: "Product Management Immersive", color: "red", code: "PMI")
p2 = Program.create!(name: "Sales & Business Development Immersive", color: "blue", code: "SBDI")
p3 = Program.create!(name: "User Experience Design Immersive", color: "green", code: "UXDI")
p4 = Program.create!(name: "Web Development Immersive", color: "orange", code: "WDI")

# Courses

sd = Date.new(2014, 10, 6)
ed = sd + 81.days

c1 = Course.create!(code: "PMI-1", start_date: sd, end_date: ed, program_id: p1.id, classroom_id: r1.id, color: p1.color)
c2 = Course.create!(code: "SBDI-1", start_date: sd + 12.weeks, end_date: ed + 12.weeks, program_id: p2.id, classroom_id: r1.id, color: p2.color)
c3 = Course.create!(code: "UXDI-1", start_date: sd, end_date: ed, program_id: p3.id, classroom_id: r2.id, color: p3.color)
c4 = Course.create!(code: "WDI-1", start_date: sd + 12.weeks, end_date: ed + 12.weeks, program_id: p4.id, classroom_id: r2.id, color: p4.color)
c5 = Course.create!(code: "PMI-2", start_date: sd, end_date: ed, program_id: p1.id, classroom_id: r3.id, color: p1.color)
c6 = Course.create!(code: "SBDI-2", start_date: sd + 12.weeks, end_date: ed + 12.weeks, program_id: p2.id, classroom_id: r3.id, color: p2.color)
c7 = Course.create!(code: "UXDI-2", start_date: sd + 24.weeks, end_date: ed + 24.weeks, program_id: p3.id, classroom_id: r1.id, color: p3.color)
c8 = Course.create!(code: "WDI-2", start_date: sd + 24.weeks, end_date: ed + 24.weeks, program_id: p4.id, classroom_id: r2.id, color: p4.color)

# Bookings

c1.classroom.bookings.create!(name: c1.code,classroom_id: c1.classroom.id, course_id: c1.id, start_at: c1.start_date, end_at: c1.end_date, color: c1.color)
c2.classroom.bookings.create!(name: c2.code,classroom_id: c2.classroom.id, course_id: c2.id, start_at: c2.start_date, end_at: c2.end_date, color: c2.color)
c3.classroom.bookings.create!(name: c3.code,classroom_id: c3.classroom.id, course_id: c3.id, start_at: c3.start_date, end_at: c3.end_date, color: c3.color)
c4.classroom.bookings.create!(name: c4.code,classroom_id: c4.classroom.id, course_id: c4.id, start_at: c4.start_date, end_at: c4.end_date, color: c4.color)
c5.classroom.bookings.create!(name: c5.code,classroom_id: c5.classroom.id, course_id: c5.id, start_at: c5.start_date, end_at: c5.end_date, color: c5.color)
c6.classroom.bookings.create!(name: c6.code,classroom_id: c6.classroom.id, course_id: c6.id, start_at: c6.start_date, end_at: c6.end_date, color: c6.color)
c7.classroom.bookings.create!(name: c7.code,classroom_id: c7.classroom.id, course_id: c7.id, start_at: c7.start_date, end_at: c7.end_date, color: c7.color)
c8.classroom.bookings.create!(name: c8.code,classroom_id: c8.classroom.id, course_id: c8.id, start_at: c8.start_date, end_at: c8.end_date, color: c8.color)

u1 = User.create!(email: "Bob@email.com", password: "password", password_confirmation: "password" )
u2 = User.create!(email: "Bill@email.com", password: "password", password_confirmation: "password" )
u3 = User.create!(email: "Jeff@email.com", password: "password", password_confirmation: "password" )
u4 = User.create!(email: "Joe@email.com", password: "password", password_confirmation: "password" )
u5 = User.create!(email: "Sam@email.com", password: "password", password_confirmation: "password" )
u6 = User.create!(email: "Anna@email.com", password: "password", password_confirmation: "password" )
u7 = User.create!(email: "Tim@email.com", password: "password", password_confirmation: "password" )
u8 = User.create!(email: "Andy@email.com", password: "password", password_confirmation: "password" )
u9 = User.create!(email: "Hannah@email.com", password: "password", password_confirmation: "password" )
u10 = User.create!(email: "Tarquin@email.com", password: "password", password_confirmation: "password" )


u1.admissions.create!(course_id: c1.id, status: 'pending')
u1.admissions.create!(course_id: c8.id, status: 'pending')
u2.admissions.create!(course_id: c2.id, status: 'pending')
u2.admissions.create!(course_id: c7.id, status: 'pending')
u3.admissions.create!(course_id: c3.id, status: 'pending')
u3.admissions.create!(course_id: c6.id, status: 'pending')
u4.admissions.create!(course_id: c4.id, status: 'pending')
u4.admissions.create!(course_id: c5.id, status: 'pending')
u5.admissions.create!(course_id: c5.id, status: 'pending')
u5.admissions.create!(course_id: c4.id, status: 'pending')
u6.admissions.create!(course_id: c6.id, status: 'pending')
u6.admissions.create!(course_id: c3.id, status: 'pending')
u7.admissions.create!(course_id: c7.id, status: 'pending')
u7.admissions.create!(course_id: c2.id, status: 'pending')
u8.admissions.create!(course_id: c8.id, status: 'pending')
u8.admissions.create!(course_id: c1.id, status: 'pending')
u9.admissions.create!(course_id: c1.id, status: 'pending')
u9.admissions.create!(course_id: c4.id, status: 'pending')
u10.admissions.create!(course_id: c2.id, status: 'pending')
u10.admissions.create!(course_id: c7.id, status: 'pending')

