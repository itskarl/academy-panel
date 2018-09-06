# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

education = ['High School', 'Bachelor\'s Degree', 'Bachelor\'s Degree', 'Bachelor\'s Degree', 'Bachelor\'s Degree', 'Bachelor\'s Degree', 'Master\'s Degree', 'Doctorate or PhD']

100.times do
  firstn = Faker::Name.first_name
  lastn = Faker::Name.last_name

  student = Student.new(
    first_name: firstn,
    last_name: lastn,
    age: rand(18..65),
    email: firstn + '_' + lastn + '@email.com',
    education_level: education.sample,
    password: 'password'
  )
  student.save
end

25.times do
  firstn = Faker::Name.first_name
  lastn = Faker::Name.last_name

  instructor = Instructor.new(
    first_name: firstn,
    last_name: lastn,
    age: rand(24..65),
    salary: rand(22_500..100_300),
    email: firstn + '_' + lastn + '@email.com',
    education_level: education.sample,
    password: 'password'
  )
  instructor.save
end

coursehours = [48, 80, 64, 96, 112]

35.times do
  course = Course.new(
    name: Faker::Company.unique.industry,
    hours: coursehours.sample
  )
  course.save
end

semester = ['Spring 2019', 'Summer 2019', 'Fall 2019']

Course.all.each do |x|
  cohort = Cohort.new(
    name: x.name + ' ' + 'Spring 2019',
    course_id: x.id,
    start_date: '2019-01-21',
    end_date: '2019-05-31'
  )
  cohort.save

  cohort2 = Cohort.new(
    name: x.name + ' ' + 'Summer 2019',
    course_id: x.id,
    start_date: '2019-06-15',
    end_date: '2019-08-26'
  )
  cohort2.save

  cohort3 = Cohort.new(
    name: x.name + ' ' + 'Fall 2019',
    course_id: x.id,
    start_date: '2019-09-02',
    end_date: '2019-12-17'
  )
  cohort3.save
end

Instructor.all.each do |q|
  user = User.new(
    first_name: q.first_name,
    last_name: q.last_name,
    password: 'password',
    email: q.email,
    instructor: true,
    admin: false,
    student: false
  )
  user.save
end

Student.all.each do |m|
  user = User.new(
    first_name: m.first_name,
    last_name: m.last_name,
    password: 'password',
    email: m.email,
    instructor: false,
    admin: false,
    student: true
  )
  user.save
end
