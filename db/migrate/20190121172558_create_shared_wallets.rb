class CreateSharedWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_wallets do |t|
      t.string  :name  
      t.integer :personal_expense_id
      t.integer :shared_expense_id

      t.timestamps
    end
  end
end
