FactoryBot.define do
  factory :question do
    title { "MyString" }
    body { "MyText" }

    trait :invalid do
      title { nil }
    end
  end

  factory :answer do
    body { "MyText" }
    question_id { 1 }
    trait :invalid do
      body { nil }
    end
  end
end
