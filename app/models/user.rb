class User < ApplicationRecord
    has_many :personal_expenses
    has_many :categories, through: :personal_expenses
    has_many :shared_wallets, through: :personal_expenses
    has_many :shared_expenses; through: :shared_wallets

    validates :first_name, :last_name, :username, :password, presence: true
    validates :username, uniqueness: true
    
end
