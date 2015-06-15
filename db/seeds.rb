# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if ENV['deseed'] 
   #Do your deseeding action here
   Category.all.each do |c|
   	c.destroy
   end

   Language.all.each do |l|
   	l.destroy
   end

   Answer.find(1).destroy

   User.find(1).destroy
   User.find(2).destroy

elsif ENV['reseed']
  #Do your seeding here.

	Category.create([{ title: 'Normale vragen'}, { title: 'Kies de juiste afbeelding' }, { title: 'Afbeelding & Woord' }]) 
	Language.create([{ title: 'Fries' }, {  title: 'Engels' }, { title: 'Nederlands' }])

	User.create([{id: 1, name: 'Admin', email: 'admin@gmail.com', password: '123qweasd', admin: true, points: 0}, 
							 {id: 2, name: 'Test persoon', email: 'test@test.nl', password: 'testtest', admin: false, points: 0}])

	Answer.create(id: 1, title: 'Time is up!')

end

if ENV['word_of_the_week']
	52.times do
	  WordOfTheWeek.create(title:'Application', description: 'Application betekent applicatie of programma in het engels')
	end
end

