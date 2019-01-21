class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.integer :budget
      t.integer :goal
      t.datetype :dob
      t.string :city

      t.timestamps
    end
  end
end
