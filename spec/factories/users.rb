FactoryBot.define do
  factory :user do
    name {"テストユーザー"}
    email {"test@example.com"}
    password {"testtest"}
    password_confirmation {"testtest"}
  end
end
