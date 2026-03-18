class Category < ApplicationRecord
  has_many :keywords, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
