class PersonalExpense < ApplicationRecord
    belongs_to :user
    belongs_to :shared_wallet
    has_one :category

    validates :name, :amount, presence: true
end
