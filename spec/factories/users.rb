FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              {Faker::Name.name}
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana }
    first_name_kana       {gimei.first.katakana}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
  end
end