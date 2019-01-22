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

40.times do
    user = {}

    user[:first_name] =  Faker::Name.first_name
    user[:last_name] =  Faker::Name.last_name
    user[:username] =  Faker::Internet.username("#{user[:first_name]} #{user[:last_name]}")
    user[:password_digest] = Faker::Internet.password
    
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
    
    wallet[:shared_expense_id] = rand(1..50)
    wallet[:personal_expense_id] = rand(150..200) 

    wallets << wallet    
end

# byebug
User.create(users)
p "Created users!"
Category.create(categories)
p "Created categories"
PersonalExpense.create(pers_expenses)
p "Created personal expenses"
SharedExpense.create(shared_expenses)
p "Created shared expenses"
SharedWallet.create(wallets)
p "Created wallets"
p "Database seeded!"