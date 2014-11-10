FactoryGirl.define do
  factory :brand do
    sequence(:category) { Brand::CATEGORIES.sample }
    sequence(:name) { Faker::Company.name }
    sequence(:url) { Faker::Internet.url }
    image nil

    factory :fake_brand_with_image do
      sequence(:remote_image_url) do
        "http://lorempixel.com/#{ImageUploader::WIDTH}/#{ImageUploader::HEIGHT}/"
      end
    end
  end
end
