class User < ApplicationRecord
    has_many :personal_expenses
    has_many :categories, through: :personal_expenses
    has_many :shared_wallets, through: :personal_expenses
    has_many :shared_expenses, through: :shared_wallets

    # validates :first_name, :last_name, :username, :password, presence: true
    # validates :username, uniqueness: true
    # validates :dob, format: { with: /\d{2}\/\d{2}\/\d{4}/ }
    # # validates :password, confirmation: true
    

    def age
        birthday = self.dob
        today = Date.today
        
        age = ((today - birthday).to_i) / 365
    end

    def month_expenses(month)
        self.personal_expenses.select do |personal_expense|
            personal_expense.created_at.month == month
        end
    end

    
    def weekly_expenses(week)
        self.personal_expenses.select do |personal_expense|
            personal_expense.created_at.week == week
        end
    end

    def expenses_by_cat(category)
        self.personal_expenses.select do |personal_expense|
            personal_expense.category == category
        end
    end

    def shared_expenses
        shared = []
        self.shared_wallets.each do |wallet|
            shared << wallet.shared_expenses
        end
        shared
    end

    def shared_users
        self.shared_expenses.map.uniq do |expense|
            expense.wallets.map do |wallet|
                wallet.user unless wallet.user == self
            end
        end
    end
end
