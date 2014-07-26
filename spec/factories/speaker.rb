FactoryGirl.define do
  factory :speaker do
    sequence(:name) { |n| "Speaker Name #{n}" }
    sequence(:description) { |n| "Speaker's description #{n}" }
    organizer false
    photo nil
  end
end
