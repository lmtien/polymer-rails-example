FactoryGirl.define do
  factory :product do
    trait :espresso do
      name { 'Espresso' }
      category { FactoryGirl.create(:category, :coffee) }
    end

    trait :latte do
      name { 'Latte' }
      category { FactoryGirl.create(:category, :coffee) }
    end

    trait :cappuccino do
      name { 'Cappuccino' }
      category { FactoryGirl.create(:category, :coffee) }
    end

    trait :green_tea do
      name { 'Green Tea' }
      category { FactoryGirl.create(:category, :tea) }
    end

    trait :hot_tea do
      name { 'Hot Tea' }
      category { FactoryGirl.create(:category, :tea) }
    end
  end
end