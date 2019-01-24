class UserWallet < ApplicationRecord
    belongs_to :user
    belongs_to :shared_wallet
end
