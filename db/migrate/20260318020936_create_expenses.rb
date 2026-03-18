class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
