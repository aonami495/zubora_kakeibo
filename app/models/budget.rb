class Budget < ApplicationRecord
  belongs_to :user

  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :month, presence: true, uniqueness: {scope: :user_id}
end
