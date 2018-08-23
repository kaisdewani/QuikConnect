# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u = User.create(email: "mail@example.com", password: "password")
u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url, phone_number: Faker::PhoneNumber.cell_phone )
u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url, phone_number: Faker::PhoneNumber.cell_phone )
u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url, phone_number: Faker::PhoneNumber.cell_phone )

5.times do |x| 
    u = User.create(email: Faker::Internet.email, password: "password")
    u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url, phone_number: Faker::PhoneNumber.cell_phone )
    u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url, phone_number: Faker::PhoneNumber.cell_phone )
    u.accounts << Account.create(name: Faker::Company.name, url: Faker::Internet.url)
end

puts "Created #{User.count} users and #{Account.count} accounts."