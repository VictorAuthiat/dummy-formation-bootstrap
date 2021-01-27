FactoryBot.define do
  factory :profile_document, class: 'Users::Profiles::Document' do
    name { Faker::Lorem.sentence }
    file { File.open(Rails.root.join('spec/fixtures/files/sample.pdf')) }
  end
end
