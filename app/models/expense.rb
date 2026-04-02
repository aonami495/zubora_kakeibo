class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :category_id, presence: true
  validates :date, presence: true
end
