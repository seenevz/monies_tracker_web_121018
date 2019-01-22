class SharedExpense < ApplicationRecord
    belongs_to :shared_wallet

    validates :name, :amount, presence: true
end
