require 'rails_helper'

RSpec.describe "Colleges", type: :system do

  let!(:user) { create(:user) }
  let!(:college) { create(:college) }
  let!(:collreview) { create(:collreview, college_id: college.id, user_id: user.id) }
  let!(:other_college) { create(:college) }
  let!(:other_college_review) { create(:other_college_review, college_id: other_college.id) }

  context '大学の個別ページにアクセスした時' do
    it '大学に関連のある情報が正しく表示される' do
      sign_in(user)
      visit college_path(college)

      expect(page).to have_content college.name
      expect(page).to have_content college.address
      expect(page).to have_content college.description
      expect(page).not_to have_content other_college.name
      expect(page).not_to have_content other_college.address
      expect(page).not_to have_content other_college.description
      expect(page).to have_content collreview.sub
      expect(page).not_to have_content other_college_review.sub
    end
  end
end
