# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name:  'Example',
             last_name: 'User',
             email: 'user@example.com',
             password:              'ciaociao',
             password_confirmation: 'ciaociao',
             admin: true)

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@rails.com"
  password = 'password'
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@rails.com"
  users.each do |user|
    user.clients.create!(first_name:  first_name,
                         last_name: last_name,
                         email: email)
  end
end
