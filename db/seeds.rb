require 'faker'

puts "Initializing seed..."

Product.destroy_all
Game.destroy_all
User.destroy_all

games = ['CS:GO', 'Dota 2', 'Team Fortress 2', 'Rust',
         'Final Fantasy XIV', 'Unturned', 'Rainbow Six Siege', 'Minecraft']

puts "Previous instances destroyed."

puts "Seeding..."
games.each do |game|
  Game.create(title: game)
  puts Game.last.title
end

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    trade_url: Faker::Internet.domain_name,
    email: Faker::Internet.email,
    password: "123123"
  )
  3.times do
    Product.create(
      name: Faker::Cannabis.strain,
      description: Faker::Lorem.characters(number: rand(8...400)),
      price: (rand * 100).round(2),
      user_id: User.last.id,
      game_id: Game.all.sample.id
    )
    puts Product.last.name
  end
  puts User.last.first_name
end

puts "Seeding complete!"
