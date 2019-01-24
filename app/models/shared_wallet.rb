class SharedWallet < ApplicationRecord
    belongs_to :personal_expense
    belongs_to :shared_expense

    def total
        self.shared_expense.amount
    end

    def tag
        self.shared_expense.category.name
    end

    def user_id
        self.personal_expense.user.id
    end

end
