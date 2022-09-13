FactoryBot.define do
  factory :course_review do
    exam { "セメスターで３回" }
    quiz { "毎週１回" }
    assignment { "毎週エッセイ提出" }
    gradedist { "exam60%課題20%quiz20%" }
    comment { "examはクイズの復習をしておくといい" }
    gradegot { "B" }
  end

  factory :other_course_review, class: CourseReview do
    exam { "mid-termとfinalの2回" }
    quiz { "２週に１回" }
    assignment { "毎週ラボのレポート提出" }
    gradedist { "examが50%と課題10%とquiz20%と出席が20%" }
    comment { "レポートは早めに出すとextra creditがもらえる" }
    gradegot { "A" }
  end
end
