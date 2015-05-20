# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ title: 'Lezen'}, { title: 'Schrijven' }]) 
Language.create([{ title: 'Fries' }, {  title: 'Engels' }, { title: 'Nederlands' }])

User.create([{name: 'Admin', email: 'admin@gmail.com', password: '123qweasd', admin: true, points: 0}, 
						 {name: 'Test persoon', email: 'test@test.nl', password: 'testtest', admin: false, points: 0}])