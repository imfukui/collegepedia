require 'rails_helper'

RSpec.describe "CourseReviews", type: :system do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:college) { create(:college) }
  let(:lesson) { create(:lesson, college_id: college.id) }
  let(:other_lesson) { create(:lesson, college_id: college.id) }
  let!(:course_review) { create(:course_review, lesson_id: lesson.id, user_id: user.id) }
  let(:other_course_review) { create(:course_review, lesson_id: other_lesson.id, user_id: other_user.id) }

  it '授業の詳細ページにその評価が正しく表示される' do
    sign_in(user)
    visit college_lesson_path(college, lesson)

    expect(page).to have_content course_review.comment
  end

  it 'ユーザーが授業の評価を作成できる' do
    sign_in(user)
    visit college_lesson_path(college, lesson)

    click_on "授業の評価を追加"
    fill_in "Quiz", with: "毎週１回"
    fill_in "課題", with: "毎週ショートエッセイの提出"
    fill_in "Exam", with: "ミッドタームとファイナル"
    fill_in "成績の配分", with: "Exam50%、Quizと課題40%、出席10%"
    fill_in "授業の評価/コツ", with: "毎週のクイズをしっかりこなす"
    click_button "追加"

    expect(page).to have_content "授業の評価を追加しました！"
  end

  it 'ユーザーが自ら作成した評価を編集できる' do
    sign_in(user)
    visit user_path(user)
    click_button 'Class'

    within "#users-course-review-container" do
      find("#course-review-edit-button").click
      click_link 'Edit'
    end

    fill_in "Quiz", with: "週１回"
    fill_in "課題", with: "隔週ショートエッセイの提出"
    fill_in "Exam", with: "中間と期末の2回"
    fill_in "成績の配分", with: "Exam60%、Quizと課題30%、出席10%"
    fill_in "授業の評価/コツ", with: "毎週のクイズはスタディーガイドをカバーする"
    click_button "更新"

    expect(page).to have_content "授業の評価を更新しました！"
  end

  it '他のユーザーが作成した評価の編集ができない' do
    sign_in(other_user)
    visit edit_course_review_path(course_review)

    expect(current_path).to eq '/'
  end

  it '他ユーザーのプロフィールページから評価を編集できない' do
    sign_in(other_user)
    visit user_path(user)

    expect(find("#users-course-review-container")).not_to have_selector 'button#course-review-edit-button'
  end
end
