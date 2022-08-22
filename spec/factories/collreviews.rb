require 'faker'

FactoryBot.define do
  factory :collreview do
    sub           { '留学生にはいい環境' }
    tuition       { Faker::Number.within(range: 5000..50000) }
    scale         { Faker::Number.within(range: 500..15000) }
    environment   { '学生の街に所在' }
    pros          { '教授ひとりに対する生徒の数が少ない' }
    cons          { '特にない' }
  end

  factory :other_college_review, class: Collreview do
    sub           { '学生が多様' }
    tuition       { Faker::Number.within(range: 5000..50000) }
    scale         { Faker::Number.within(range: 500..15000) }
    environment   { '緑が多い街にある' }
    pros          { '周囲の学生が刺激になる' }
    cons          { '遠出するには不便' }
  end
end
