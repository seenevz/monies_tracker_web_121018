class SharedWallet < ApplicationRecord
    belongs_to :personal_expense
    belongs_to :shared_expense

end
