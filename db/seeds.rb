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
	Language.create([{ title: 'Fries' }, { title: 'Engels' }, { title: 'Nederlands' }])

	User.create([{id: 1, name: 'Jelle Brandsma', email: 'jelle@switsj.com', password: '123qweasd', admin: true, points: 0}])

	Answer.create(id: 1, title: 'Time is up!')

end

if ENV['word_of_the_week']
	52.times do
      WordOfTheWeek.create(title:'Application', description: 'Application betekent applicatie of programma in het engels')
	end
end

