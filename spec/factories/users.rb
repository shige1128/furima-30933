FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    family_name           {Gimei.last}
    first_name            {Gimei.first}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    email                 {Faker::Internet.free_email}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 85)}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end