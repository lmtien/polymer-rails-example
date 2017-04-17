FactoryGirl.define do
  factory :product_size do
    trait :tall do
      name { 'Tall' }
    end

    trait :grande do
      name { 'Grande' }
    end

    trait :venti do
      name { 'Venti' }
    end
  end
end