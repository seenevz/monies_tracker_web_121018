class Category < ApplicationRecord
    has_many :personal_expenses
    has_many :shared_expenses 
    

    validates :name, presence: true
end
