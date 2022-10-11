require 'faker'

FactoryBot.define do
  factory :lesson do
    title       { Faker::Educator.course_name }
    professor   { Faker::Name.name }
    department  { Faker::Educator.subject }
  end
end
