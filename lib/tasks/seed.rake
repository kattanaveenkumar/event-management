task :setup_data => :environment do
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
	user = User.create(email: "attendee@event.com", username: "Attendee", password: "atte@123")
	user.roles.push(Role.last)

end