FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.birthday }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
