require 'faker'

FactoryBot.define do
  factory :lesson do
    title { Faker::Educator.course_name }
    professor { Faker::Name.name }
  end
end
