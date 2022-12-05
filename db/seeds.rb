# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username:"tmureithi", email:"tim@mail.com",password:"test123",password_confirmation:"test123",first_name:"Timothy",last_name:"Mureithi")
User.create!(username:"jmuthoni", email:"judy@mail.com",password:"test1234",password_confirmation:"test1234",first_name:"Judy",last_name:"Muthoni")
