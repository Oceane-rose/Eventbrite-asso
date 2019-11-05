# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

2.times do
	User.create(
		first_name: Faker::Name.first_name,
		last_name:Faker::Name.last_name, 
		description:Faker::Lorem.paragraph, 
		email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@yopmail.com",
		encrypted_password:"password")
end



8.times do
	Event.create(
		start_date: Faker::Date.forward(days: 365), 
		duration: rand(6..1000)*5, 
		price: rand(5..1000), 
		description:Faker::Lorem.paragraph, 
		title: Faker::Movies::StarWars.quote, 
		location: Faker::Address.city)
end



20.times do
	Attendance.create(
		user: User.all.sample, 
		event: Event.all.sample, 
		stripe_customer_id: SecureRandom.urlsafe_base64)
end


@user= User.create(first_name: "alice", last_name:Faker::Name.last_name, description:Faker::Lorem.paragraph, email: "alice@hotmail.fr",encrypted_password:"password")

