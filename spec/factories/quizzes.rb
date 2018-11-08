FactoryBot.define do
  factory :quiz do
		sequence(:email) { |n| "finsa#{n}@example.com" }
    start_time Time.now

    trait :invalid do
      email nil
    end    
  end
end
