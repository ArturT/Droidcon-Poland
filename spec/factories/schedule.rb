FactoryGirl.define do
  factory :schedule do
    sequence(:language) { A9n.languages.sample }
    sequence(:topic) { |n| "Topic #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    start_time DateTime.now.beginning_of_day
    end_time DateTime.now.beginning_of_day + 1.hour
    speaker
    second_speaker
    room

    factory :fake_schedule do
      sequence(:topic) { Faker::Lorem.sentence }
      sequence(:description) { Faker::Lorem.paragraph(2) }
    end
  end
end
