FactoryBot.define do
  # fakerの導入を検討する
  factory :user do
    email                 { 'test@gmail.com' }
    name                  { 'テスト' }
    password              { 'Aa111111' }
    password_confirmation { 'Aa111111' }
  end
end
