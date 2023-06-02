require 'faker'

puts "Initializing seed..."

Order.destroy_all
Product.destroy_all
Game.destroy_all
User.destroy_all

puts "Previous instances destroyed."

games = [['CS:GO', 'app/assets/images/game-posters/csgo.jpg'], ['Dota 2', 'app/assets/images/game-posters/dota-2.jpg'], ['Team Fortress 2', 'app/assets/images/game-posters/tf2.jpg'], ['Rust', 'app/assets/images/game-posters/rust.webp'],
         ['Final Fantasy XIV', 'app/assets/images/game-posters/final-fantasy-xiv.jpeg'], ['Unturned', 'app/assets/images/game-posters/Unturned.webp'], ['Rainbow Six Siege', 'app/assets/images/game-posters/r6.jpg'], ['Minecraft', 'app/assets/images/game-posters/minecraft.jpg']]

puts "Seeding..."
games.each do |game|
  g = Game.new(title: game[0])
  g.photo.attach(io: File.open(game[1]), filename: game[0].downcase + '.jpg')
  g.save!
  puts g.title
end

# 10.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     trade_url: Faker::Internet.domain_name,
#     email: Faker::Internet.email,
#     password: "123123"
#   )
#   puts "User: #{User.last.first_name}"
#   3.times do
#     Product.create(
#       name: Faker::Cannabis.strain,
#       description: Faker::Lorem.characters(number: rand(8...400)),
#       price: (rand * 100).round(2),
#       user_id: User.last.id,
#       game_id: Game.all.sample.id
#     )
#     puts "   Product: #{Product.last.name}"
#   end
# end

User.create(first_name: "Admin", last_name: "Admin", trade_url: "https://steamcommunity.com/tradeoffer/new/?partner=123456789&token=123456789", email: "admin@admin", password: "123123")
puts "Created admin: #{User.last.email}"

puts "Seeding complete!"
