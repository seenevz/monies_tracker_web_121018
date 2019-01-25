class CreatePersonalExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_expenses do |t|
      t.string :name
      t.integer :amount
      t.string :type
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
