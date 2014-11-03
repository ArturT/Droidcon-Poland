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
counter = 10

rooms = []
2.times do
  rooms << FactoryGirl.create(:fake_room)
  puts "[Success] Room #{rooms.last.name} created!"
end

puts

speakers = []
counter.times do
  # use factory girl called fake_speaker_with_photo if you want to store image on your machine instead of using fallback photo
  speakers << FactoryGirl.create(:fake_speaker)
  puts "[Success] Speaker #{speakers.last.name} created!"
end

puts

schedules = []
counter.times do |i|
  schedules << FactoryGirl.create(:fake_schedule,
                                  speaker: speakers[i],
                                  room: rooms[i % rooms.count])
  puts "[Success] Schedule #{schedules.last.topic} created!"
end
