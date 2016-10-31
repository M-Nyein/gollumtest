# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Division.create!([{name: 'd3'}, {name: 'd4'}, {name: 'd5'}, {name: 'd6'}, {name: 'd7'}, {name: 'd8'}, {name: 'd9'}])

Town.create!([{name: 't3', division_id: '1'}, {name: 't4', division_id: '1'}, {name: 't5', division_id: '1'}, {name: 't6', division_id: '1'}, {name: 't7', division_id: '1'}, {name: 't8', division_id: '1'}, {name: 't9', division_id: '1'},{name: 't3', division_id: '1'}, {name: 't4', division_id: '1'}, {name: 't5', division_id: '1'}, {name: 't6', division_id: '1'}, {name: 't7', division_id: '1'}, {name: 't8', division_id: '1'}, {name: 't9', division_id: '1'}])


User.create(email: "admin@admin.com", password: 123456, role: "admin")
User.create(email: "user@user.com", password: 123456)


