class CreateSharedExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_expenses do |t|
      t.string :name
      t.integer :amount
      t.integer :category_id

      t.timestamps
    end
  end
end
