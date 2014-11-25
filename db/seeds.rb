# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a default user
admin = OpenStruct.new(
  email: 'admin@example.com',
  password: 'password')

if AdminUser.exists?(email: admin.email)
  puts "[Info] Admin #{admin.email} already exists!"
else
  AdminUser.create!(
    email: admin.email,
    password: admin.password,
    password_confirmation: admin.password)
  puts "[Success] Admin #{admin.email} created!"
end

puts

# Create rooms, speakers, schedules
counter = 15

rooms = []
2.times do
  rooms << FactoryGirl.create(:fake_room)
  puts "[Success] Room #{rooms.last.name} created!"
end

puts

speakers = []
counter.times do |i|
  # use factory girl called fake_speaker_with_photo if you want to store image on your machine instead of using fallback photo
  speakers << FactoryGirl.create(:fake_speaker, organizer: i < 3)
  puts "[Success] Speaker #{speakers.last.name} created!"
end

puts

schedules = []
counter.times do |i|
  extra_days = (i < counter.size/2 ? 0 : 1)
  start_time = DateTime.now.beginning_of_day + extra_days + (i..counter).to_a.sample.hours
  end_time = start_time + 1.hour
  second_speaker = i < 3 ? speakers[i+1] : nil
  schedules << FactoryGirl.create(:fake_schedule,
                                  speaker: speakers[i],
                                  second_speaker: second_speaker,
                                  room: rooms[i % rooms.count],
                                  start_time: start_time,
                                  end_time: end_time)
  puts "[Success] Schedule #{schedules.last.topic} created!"
end

puts

Brand::CATEGORIES.each do |category|
  brand = FactoryGirl.create(:brand, category: category)
  puts "[Success] Brand #{brand.name} created!"
  brand = FactoryGirl.create(:fake_brand_with_image, category: category)
  puts "[Success] Brand with image #{brand.name} created!"
end
