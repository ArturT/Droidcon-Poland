FactoryGirl.define do
  factory :room do
    sequence(:name) { |n| "Room Name #{n}" }

    factory :fake_room do
      sequence(:name) { "Room #{Faker::Lorem.word}" }
    end
  end
end
