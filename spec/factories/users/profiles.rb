FactoryBot.define do
  factory :users_profile, class: 'Users::Profile' do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.birthday(min_age: 18) }
  end
end
