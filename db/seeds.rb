# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Manish Nikam",
			 email: "manish@gmail.com",
			 password: "manish",
			 password_confirmation: "manish",
			 admin: true)

99.times do |i|
	name = Faker::Name.name
	email = "manish-#{i+1}@gmail.com"
	password = "manish"
	User.create!(name: name,
				 email: email,
				 password_confirmation: password,
				 password: password)
end