require 'faker'

FactoryBot.define do
  factory :college do
    name        { Faker::University.name }
    address     { Faker::Address.full_address }
    sector      { 'private' }
    estyear     { Faker::Number.within(range: 1800..1950) }
    mingpa      { Faker::Number.within(range: 2.0..3.8) }
    description { Faker::Quote.famous_last_words }
  end
end
