FactoryBot.define do
  Factory :user do
    name {Faker::WorldCup.roster}
    email {}
  end
end
