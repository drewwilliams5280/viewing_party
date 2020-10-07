FactoryBot.define do
  factory :user do
    name { Faker::WorldCup.roster }
    email { Faker::Internet.email }
    password { Faker::Internet.password}
  end
end
