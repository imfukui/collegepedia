require 'rails_helper'

RSpec.describe "Collreviews", type: :system do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:college) { create(:college) }
  let(:collreview) { create(:collreview, college_id: college.id, user_id: user.id)}
  let(:other_collreview) { create(:collreview, user_id: other_user.id) }

  scenario 'ユーザーが大学の評価を新規作成・更新できる' do
    sign_in(user)
    visit college_path(college)

    expect {
      click_link "大学の評価を作成"

      fill_in "レビューのタイトル", with: "タイトル"
      fill_in "学費", with: "30000"
      fill_in "学生数", with: "15000"
      fill_in "環境", with: "治安良し"
      fill_in "いいと思うところ", with: "様々な機会が多い"
      fill_in "改善してほしいところ", with: "寮のシステム"
      click_button "作成する"

      expect(page).to have_content "大学の評価を作成しました！"
    }.to change(user.collreviews, :count).by(1)

    click_on "Menu"
    click_link "Profile"

    expect(page).to have_content user.name
    expect(page).to have_content "タイトル"
    expect(page).to have_content "治安良し"

    click_link "Edit"

    fill_in "いいと思うところ", with: "勉強に集中できる環境"
    click_button "更新する"

    expect(page).to have_content "大学の評価を更新しました！"
  end

  scenario '他ユーザーの大学の評価を編集・削除できない' do
    sign_in(user)
    visit user_path(other_user)

    expect(page).to have_content other_user.name
    expect(page).to have_no_link "Delete"

    visit edit_collreview_path(other_collreview)
    fill_in "レビューのタイトル", with: "タイトル変更"
    click_button "更新する"

    expect(page).to have_content "更新できませんでした"
  end
end
