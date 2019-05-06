require 'faker'

User.destroy_all

puts '-> Je charge un jeu d\'essai User'
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name+"@yopmail.com"
  )
end

puts '***** Base de données chargée avec un seed ! Have a nice run.*****'