require 'rails_helper'

RSpec.describe "Collreviews", type: :system do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:college) { create(:college) }
  let!(:collreview) { create(:collreview, college_id: college.id, user_id: user.id)}
  let(:other_collreview) { create(:collreview, user_id: other_user.id) }

  it 'ユーザーが学校の評価を新規追加できる' do
    sign_in(user)
    visit college_path(college)

    expect {
      click_link "評価を追加"

      fill_in "レビュータイトル", with: "タイトル"
      fill_in "学費", with: "30000"
      fill_in "生徒数", with: "15000"
      fill_in "環境", with: "治安良し"
      fill_in "いいと思うところ", with: "様々な機会が多い"
      fill_in "改善してほしいところ", with: "寮のシステム"
      click_button "追加"

      expect(page).to have_content "学校の評価を作成しました！"
    }.to change(user.collreviews, :count).by(1)
  end

  it 'ユーザーが学校の評価を編集できる' do
    sign_in(user)
    visit edit_collreview_path(collreview)

    expect(page).to have_content(collreview.environment)
    expect(page).to have_content(collreview.pros)
    expect(page).to have_content(collreview.cons)

    fill_in "いいと思うところ", with: "勉強に集中できる環境"
    click_button "更新"

    expect(page).to have_content "学校の評価を更新しました！"
  end

  it '他ユーザーの学校の評価を編集・削除できない' do
    sign_in(user)
    visit user_path(other_user)

    expect(page).to have_content other_user.name
    expect("#users-college-review-container").to have_no_selector "#collreview-edit-button"

    visit edit_collreview_path(other_collreview)

    expect(current_path).to eq '/'
  end
end
