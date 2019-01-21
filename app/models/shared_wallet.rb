class SharedWallet < ApplicationRecord
    has_many :personal_expense
    has_many :shared_expense

end
