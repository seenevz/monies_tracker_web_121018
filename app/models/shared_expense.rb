class SharedExpense < ApplicationRecord
    has_many :shared_wallets
    belongs_to :category

    # validates :name, :amount, presence: true
end
