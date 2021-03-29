FactoryBot.define do
  factory :room do
    room_name {Faker::Team.room_name}
  end
end