class CreateUserWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wallets do |t|
      t.integer :user_id
      t.integer :shared_wallet_id

      t.timestamps
    end
  end
end
