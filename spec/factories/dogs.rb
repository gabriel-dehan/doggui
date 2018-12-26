require 'faker'
FactoryBot.define do
  factory :dog do
    user
    nickname { Faker::Name.name}
  end
end
