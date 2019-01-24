class SharedWallet < ApplicationRecord
    belongs_to :personal_expense
    belongs_to :shared_expense
    has_many :user_wallets
    has_many :users, through: :user_wallets

    def total
        self.shared_expense.amount
    end

    def tag
        self.shared_expense.category.name
    end

    

end
