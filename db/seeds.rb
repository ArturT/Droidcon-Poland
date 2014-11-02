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
