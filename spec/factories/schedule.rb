FactoryGirl.define do
  factory :schedule do
    sequence(:topic) { |n| "Topic #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    start_time DateTime.now
    end_time DateTime.now + 1.hour
    speaker
    room
  end
end
