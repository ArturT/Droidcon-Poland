FactoryGirl.define do
  factory :schedule do
    sequence(:topic) { |n| "Topic #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    start_time DateTime.now.beginning_of_day
    end_time DateTime.now.beginning_of_day + 1.hour
    speaker
    room
  end
end
