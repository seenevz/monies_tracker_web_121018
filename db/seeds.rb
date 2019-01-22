# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


users = []
categories = []

40.times do
    user = {}
    user[:first_name] =  Faker::Name.first_name
    user[:last_name] =  Faker::Name.last_name
    user[:username] =  Faker::Internet.username("#{user[:first_name]} #{user[:last_name]}")
    user[:password] = Faker::Internet.password
    
    users << user
end

5.times do 
    category = {}
    category[:name] = Faker::Cat.breed

    categories << category
end
byebug
User.create(users)
Category.create(categories)