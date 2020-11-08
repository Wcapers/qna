FactoryBot.define do
  factory :question do
    user
    title { "Title" }
    body { "Body" }

    trait :invalid do
      title { nil }
    end
  end
end
