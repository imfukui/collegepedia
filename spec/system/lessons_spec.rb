require 'rails_helper'

RSpec.describe "Lessons", type: :system do

  let(:user) { create(:user) }
  let(:college) { create(:college) }
  let(:lesson) { create(:lesson, college_id: college.id) }

  scenario 'ユーザーが大学のクラスを登録・編集できる' do
    sign_in(user)
    visit college_lessons_path(college)

    click_on "クラスを追加"

    fill_in "クラス名", with: "BIO 105"
    fill_in "教授名", with: "Michael Smith"
    fill_in "学部区分", with: "Biology"
    click_button "追加する"

    expect(page).to have_content "クラスを登録しました！"

    visit college_lesson_path(college, lesson)
    click_on "クラスの情報を更新"

    fill_in "クラス名", with: "Engineering 105"
    fill_in "教授名", with: "John Burns"
    fill_in "学部区分", with: "Engineering"
    click_button "更新する"

    expect(page).to have_content "クラスの情報を更新しました"
  end
end
