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
pers_expenses = []
shared_expenses = []
wallets = []
user_wallets = []

40.times do
    user = {}

    user[:first_name] =  Faker::Name.first_name
    user[:last_name] =  Faker::Name.last_name
    user[:username] =  Faker::Internet.username("#{user[:first_name]} #{user[:last_name]}")
    user[:password_digest] = Faker::Internet.password
    user[:dob] = Faker::Date.birthday(18, 65)
    user[:budget] = rand(100..1000)
    user[:goal] = rand(100..1000)
    user[:city] = Faker::Address.city
    
    users << user
end

10.times do 
    category = {}

    category[:name] = Faker::Cat.breed

    categories << category
end

# byebug

200.times do 
    expense = {}

    expense[:name] = Faker::Lorem.word  
    expense[:amount] = rand(300) 
    expense[:category_id] = rand(1..10)  
    expense[:user_id] =  rand(40)

    pers_expenses << expense
end
# byebug

50.times do 
    expense = {}

    expense[:name] = Faker::Lorem.word
    expense[:amount] = rand(300)
    expense[:category_id] = rand(1..10)

    shared_expenses << expense
end

20.times do 
    wallet = {}
    
    wallet[:name] = Faker::Lorem.word
    wallet[:shared_expense_id] = rand(1..50)
    wallet[:personal_expense_id] = rand(150..200) 

    wallets << wallet    
end

20.times do 
    user_wallet = {}
    
    user_wallet[:user_id] = rand(1..40)
    user_wallet[:shared_wallet_id] = rand(1..20) 
    
    user_wallets << user_wallet    
end


User.create(users)
puts "Created users!"
Category.create(categories)
puts "Created categories!"
PersonalExpense.create(pers_expenses)
puts "Created personal expenses!"
SharedExpense.create(shared_expenses)
puts "Created shared expenses!"
SharedWallet.create(wallets)
puts "Created wallets!"
# UserWallet.create(user_wallets)
# # byebug
# puts "Created user wallets!"
puts "Database seeded!"