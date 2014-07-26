FactoryGirl.define do
  factory :room do
    sequence(:name) { |n| "Room Name #{n}" }
  end
end
