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

90.times do |n|
  sub = "タイトル"
  tuition = Faker::Number.within(range: 5000..50000)
  scale = Faker::Number.within(range: 500..20000)
  environment = "治安が良くて学生街にある"
  pros = "いろいろな国から留学生を受け入れている"
  cons = "サークル等がないのでコミュニティに所属するのが難しい"
  college_id = Faker::Number.within(range: 1..30)
  user_id = Faker::Number.within(range: 1..15)

  Collreview.create!(
    sub: sub,
    tuition: tuition,
    scale: scale,
    environment: environment,
    pros: pros,
    cons: cons,
    college_id: college_id,
    user_id: user_id
  )
end

300.times do |n|
  exam = "ミッドタームとファイナルの2回"
  quiz = "毎週1回"
  assignment = "毎週ショートエッセイの提出がある"
  gradedist = "exam50%/quiz20%/assignment20%/attendance10%"
  comment = "クイズの復習がexam対策になる"
  gragegot = "B"
  lesson_id = Faker::Number.within(range: 1..150)
  user_id = Faker::Number.within(range: 1..15)

  CourseReview.create!(
    exam: exam,
    quiz: quiz,
    assignment: assignment,
    gradedist: gradedist,
    comment: comment,
    gradegot: gragegot,
    lesson_id: lesson_id,
    user_id: user_id
  )
end
