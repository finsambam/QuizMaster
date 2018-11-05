FactoryBot.define do
  factory :question do
    text "2+2?"
    question_type "essay"
    answer "4"
    association :user

    trait :invalid do
      text nil
    end
  end
end
