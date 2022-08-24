FactoryBot.define do
  factory :course_review do
    title { "MyString" }
    exam { "MyString" }
    quiz { "MyString" }
    assignment { "MyString" }
    gradedist { "" }
    comment { "" }
    gradegot { "MyString" }
    lesson_id { 1 }
    user_id { 1 }
  end
end
