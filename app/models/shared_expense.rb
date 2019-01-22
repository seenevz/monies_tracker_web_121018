class SharedExpense < ApplicationRecord
    has_many :shared_wallets

    # validates :name, :amount, presence: true
end
