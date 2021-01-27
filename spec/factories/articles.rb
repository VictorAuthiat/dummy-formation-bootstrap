FactoryBot.define do
  factory :article do
    user
    label { Faker::Lorem.word }
    title { Faker::Lorem.sentence(word_count: 3) }
    published_at { Faker::Date.backward(days: 3) }
    content { Faker::Lorem.paragraph(sentence_count: 5) }
    picture { File.open("spec/fixtures/#{%w[yellow red green].sample}.png") }
  end
end
