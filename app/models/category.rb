class Category < ApplicationRecord
    belongs_to :personal_expense
    

    validates :name, presence: true
end
