class CreateBudgets < ActiveRecord::Migration[7.2]
  def change
    create_table :budgets do |t|
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.date :month

      t.timestamps
    end
  end
end
