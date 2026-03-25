class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, numericality: { only_integer: true }
end
