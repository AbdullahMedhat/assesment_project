# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create!(email: "a@a.com", password: "12345678", password_confirmation: "12345678", name: "Admin 1")
Program.create!(name: "FireUp", description: "3 Months boot camp for web development")
Program.create!(name: "GearUp", description: "Front end course")
