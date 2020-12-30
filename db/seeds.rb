# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", phone: "0987987987", email: "admin@gmail.com", password: "123456", admin: true) unless User.find_by admin: true
user = User.find_by(admin: false) || User.create(name: "user", phone: "0987987987", email: "user@gmail.com", password: "123456")
user.tasks << Task.where("user_id IS ?", nil)
