FactoryBot.define do
  factory :user do
    nickname              {"fukui"}
    email                 {"aaa@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
  end
end