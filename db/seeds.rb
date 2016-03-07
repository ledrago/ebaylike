# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(firstname:  "Hari",
             lastname:  "Seldon",
             email: "hariseldon@gmail.com",
             password:              "hari",
             password_confirmation: "hari",
             postal_adress: "planete foundation",
             admin: true)
