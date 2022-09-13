require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe 'ログイン前' do

    exist_user = FactoryBot.create(:user)

    describe 'アカウント作成' do
      context '正常な情報を入力した場合' do
        it 'アカウント作成に成功する' do
          visit new_user_registration_path

          fill_in "Name", with: "テストユーザー"
          fill_in "メールアドレス", with: "unique@yahoo.com"
          fill_in "パスワード", with: "password"
          fill_in "確認用パスワード", with: "password"
          click_button "アカウント登録"

          expect(page).to have_content "アカウント登録が完了しました"
        end
      end

      context '登録済みのメールアドレスを入力した時' do
        it 'アカウント作成に失敗する' do
          visit new_user_registration_path

          fill_in "Name", with: "テストユーザー"
          fill_in "メールアドレス", with: exist_user.email
          fill_in "パスワード", with: "password"
          fill_in "確認用パスワード", with: "password"
          click_button "アカウント登録"

          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end

      context 'メールアドレス未入力の時' do
        it 'アカウント作成に失敗する' do
          visit new_user_registration_path

          fill_in "Name", with: "テストユーザー"
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: "password"
          fill_in "確認用パスワード", with: "password"
          click_button "アカウント登録"

          expect(page).to have_content "メールアドレスを入力してください"
        end
      end
    end

    describe 'ログイン' do
      context '作成済みのアカウントでログインする場合' do
        it '正常にログインできる' do
          visit '/'

          click_link "Login"
          fill_in "メールアドレス", with: exist_user.email
          fill_in "パスワード", with: exist_user.password
          click_button "ログイン"

          expect(page).to have_content "ログインしました"
        end
      end
    end
  end

  describe 'ログイン後' do

    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'ユーザー情報を編集' do
      context '入力情報が正常なとき' do
        it 'ユーザー情報の更新に成功する' do
          sign_in(user)
          visit edit_user_registration_path

          fill_in "Name", with: "testuser"

          click_button "更新"

          expect(page).to have_content "アカウント情報を変更しました"
        end
      end

      context '登録済みのメールアドレスを入力した時' do
        it 'ユーザー情報の変更に失敗する' do
          sign_in(user)
          visit edit_user_registration_path

          fill_in "メールアドレス", with: other_user.email

          click_button "更新"

          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end
    end
  end

  scenario 'ゲストユーザーは情報の変更・削除ができない' do
    visit '/'

    click_link "Login"
    click_button "ゲストログイン"
    click_button "Menu"
    click_link "Edit Account"

    fill_in "メールアドレス", with: "updated@yahoo.com"
    click_button "更新"

    expect(page).to have_content "ゲストユーザーは更新・削除できません"
  end
end
