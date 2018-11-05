FactoryBot.define do
  factory :user do
    name  "Finsa"
    sequence(:email) { |n| "finsa#{n}@example.com" }
    password "1q2w3e4r5t"
  end	
end
