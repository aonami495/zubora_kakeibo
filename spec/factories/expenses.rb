# spec/factories/expenses.rb
FactoryBot.define do
  factory :expense do
    amount { 1000 }
    date { Date.current }
    association :user
    association :category
  end
end
