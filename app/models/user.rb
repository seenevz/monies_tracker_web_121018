class User < ApplicationRecord
    has_many :personal_expenses
    has_many :user_wallets
    has_many :categories, through: :personal_expenses
    has_many :shared_wallets, through: :user_wallets
    has_many :shared_expenses, through: :shared_wallets

    has_secure_password

    

    validates :first_name, :last_name, :username, :password, presence: true
    validates :username, uniqueness: true
    # validates :dob, format: { with: /\d{2}\/\d{2}\/\d{4}/ }
    validates :password, confirmation: true
    

    def age
        birthday = Date.parse(self.dob)
        today = Date.today
        
        age = ((today - birthday).to_i) / 365
    end

    def budget_left
        leftover = self.budget - current_month_expenses_total

        if leftover <= 0 
            "You spent it all!"
        else
            leftover
        end
    end

    def update_saving_month
        today = DateTime.new

        if today == today.end_of_month
        self.saved_goal += self.budget_left
        else
            budget_left
        end        
    end

    def month_expenses(month)
        self.personal_expenses.select do |personal_expense|
            personal_expense.created_at.month == month
        end
    end

    def current_month_expenses_total
        total = 0

        month_expenses(Date.today.month).each do |expense|
            total += expense.amount
        end
        total
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
