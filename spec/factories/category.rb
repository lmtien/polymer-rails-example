FactoryGirl.define do
  factory :category do
    trait :coffee do
      name { 'Coffee' }
    end

    trait :tea do
      name { 'Tea' }
    end
  end
end