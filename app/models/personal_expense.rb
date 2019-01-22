class PersonalExpense < ApplicationRecord
    belongs_to :user
    has_one :shared_wallet
    belongs_to :category

    # validates :name, :amount, presence: true
end
