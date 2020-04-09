# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Role.create(name: "admin")
	Role.create(name: "host")
	Role.create(name: "attendee")

	#Admin
	user = User.create(email: "admin@event.com", name: "Admin", password: "admin@123")
	user.roles.push(Role.first)
	user.roles.push(Role.last)

	#Host
	user1 = User.create(email: "host@event.com", name: "Host", password: "host@123")
	user1.roles.push(Role.second)
	user1.roles.push(Role.last)

	#Attendee
	user = User.create(email: "attendee@event.com", name: "Attendee", password: "atte@123")
	user.roles.push(Role.last)

