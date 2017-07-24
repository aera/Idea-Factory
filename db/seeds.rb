User.destroy_all
Idea.destroy_all
Review.destroy_all

PASS = '12345'

users = User.create([
    {first_name: 'Harry', last_name: 'Potter', email: 'hp@griffindor.org', password: '12345'},
    {first_name: 'Hermione', last_name: 'Granger', email: 'hermi@griffindor.org', password: '12345'},
    {first_name: 'Severus', last_name: 'Snape', email: 'ssnape@hogwarts.edu', password: '12345'},
    {first_name: 'Albertus', last_name: 'Dumbledore', email: 'dumble@hogwarts.edu', password: '12345'},
    {first_name: 'Lucius', last_name: 'Malfoy', email: 'lmalfoy@slitherin.org', password: '12345'},
    {first_name: 'Cyrus', last_name: 'Black', email: 'cblack@azkaban.net', password: '12345'},
    {first_name: 'Ron', last_name: 'Weasley', email: 'rwes@griffindor.org', password: '12345'},
    {first_name: 'Filius', last_name: 'Flitwick', email: 'fili@goblin.org', password: '12345'},
    {first_name: 'Minerva', last_name: 'McGonagall', email: 'Mmcgonagal@hogwarts.edu', password: '12345'},
    {first_name: 'Rubeus', last_name: 'Hagrid', email: 'ruhag@zookeeper.net', password: '12345'},
    {first_name: 'Cedric', last_name: 'Diggory', email: 'ceddig@ravenclaw.org', password: '12345'},
    {first_name: 'Luna', last_name: 'Lovegood', email: 'lunalove@invisible.net', password: '12345'},
    {first_name: 'Neville', last_name: 'Longbottom', email: 'nevibot@naughties.com', password: '12345'},
    {first_name: 'Draco', last_name: 'Malfoy', email: 'dracom@slitherin.org', password: '12345'},
    {first_name: 'Tom', last_name: 'Riddle', email: 'hewho@noname.gov', password: '12345'}
])

100.times do
  Idea.create(
	title: Faker::HarryPotter.quote,
	description: Faker::Hipster.paragraph,
	user: users.sample
  )
end

ideas = Idea.all

ideas.each do |i|
  rand(1..9).times do
	Review.create(body: Faker::FamilyGuy.quote, idea: i)
  end
end
