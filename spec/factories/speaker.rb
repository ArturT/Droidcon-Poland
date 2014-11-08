include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :speaker do
    sequence(:name) { |n| "Speaker Name #{n}" }
    sequence(:description) { |n| "Speaker's description #{n}" }
    organizer false
    photo nil
    sequence(:facebook_url) { Faker::Internet.url('https://facebook.com') }
    sequence(:twitter_url) { Faker::Internet.url('https://twitter.com') }
    sequence(:google_plus_url) { Faker::Internet.url('https://plus.google.com') }

    factory :fake_speaker do
      sequence(:name) { Faker::Name.name }
      sequence(:description) { Faker::Lorem.paragraph }

      factory :fake_speaker_with_photo do
        sequence(:remote_photo_url) { Faker::Avatar.image(nil, "#{PhotoUploader::WIDTH}x#{PhotoUploader::HEIGHT}") }
      end
    end
  end
end
