FactoryBot.define do
  factory :profiles_document, class: 'Users::Profiles::Document' do
    profile { FactoryBot.create :users_profile }
    name { Users::Profiles::Document::DOCUMENT_TYPES.sample }
    file { File.open(Rails.root.join('spec/fixtures/files/sample.pdf')) }
  end
end
