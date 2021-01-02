FactoryBot.define do
  # fakerの導入を検討する
  factory :user do
    email                 {"test@gmail.com"}
    name                  {"テスト"}
    password              {"111111"}
    password_confirmation {"111111"}
  end
end
