# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

30.times do |n|
  name = Faker::University.name
  address = Faker::Address.state
  estyear = Faker::Number.within(range: 1800..1960)
  mingpa = Faker::Number.within(range: 2..3)

  College.create!(
    name: name,
    address: address,
    sector: "private",
    estyear: estyear,
    mingpa: mingpa,
    description: "description"
  )
end

15.times do |n|
  name = Faker::Internet.username
  email = Faker::Internet.unique.email(domain: 'example')
  password = "password"

  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

150.times do |n|
  title = Faker::Educator.course_name
  professor = Faker::Name.name
  department = Faker::Educator.subject
  college_id = Faker::Number.within(range: 2..21)

  Lesson.create!(
    title: title,
    professor: professor,
    department: department,
    college_id: college_id
  )
end
