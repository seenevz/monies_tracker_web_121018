class PersonalExpense < ApplicationRecord
    belongs_to :user
    belongs_to :shared_wallet
    belongs_to :category

    validates :name, :amount, presence: true
end
