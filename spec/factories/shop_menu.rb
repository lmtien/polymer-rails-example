FactoryGirl.define do
  factory :shop_menu do
    trait :espresso_tall do
      price { 1.95 }
      product { FactoryGirl.create(:product, :espresso) }
      product_size { FactoryGirl.create(:product_size, :tall) }
    end
    trait :espresso_grande do
      price { 2.05 }
      product { FactoryGirl.create(:product, :espresso) }
      product_size { FactoryGirl.create(:product_size, :grande) }
    end
    trait :espresso_venti do
      price { 2.35 }
      product { FactoryGirl.create(:product, :espresso) }
      product_size { FactoryGirl.create(:product_size, :venti) }
    end

    trait :latte_tall do
      price { 3.4 }
      product { FactoryGirl.create(:product, :latte) }
      product_size { FactoryGirl.create(:product_size, :tall) }
    end
    trait :latte_grande do
      price { 4.45 }
      product { FactoryGirl.create(:product, :latte) }
      product_size { FactoryGirl.create(:product_size, :grande) }
    end
    trait :latte_venti do
      price { 4.65 }
      product { FactoryGirl.create(:product, :latte) }
      product_size { FactoryGirl.create(:product_size, :venti) }
    end

    trait :cappuccino_tall do
      price { 3.15 }
      product { FactoryGirl.create(:product, :cappuccino) }
      product_size { FactoryGirl.create(:product_size, :tall) }
    end
    trait :cappuccino_grande do
      price { 3.75 }
      product { FactoryGirl.create(:product, :cappuccino) }
      product_size { FactoryGirl.create(:product_size, :grande) }
    end
    trait :cappuccino_venti do
      price { 4.15 }
      product { FactoryGirl.create(:product, :cappuccino) }
      product_size { FactoryGirl.create(:product_size, :venti) }
    end

    trait :green_tea_tall do
      price { 3.45 }
      product { FactoryGirl.create(:product, :green_tea) }
      product_size { FactoryGirl.create(:product_size, :tall) }
    end
    trait :green_tea_grande do
      price { 4.25 }
      product { FactoryGirl.create(:product, :green_tea) }
      product_size { FactoryGirl.create(:product_size, :grande) }
    end
    trait :green_tea_venti do
      price { 4.45 }
      product { FactoryGirl.create(:product, :green_tea) }
      product_size { FactoryGirl.create(:product_size, :venti) }
    end

    trait :hot_tea_grande do
      price { 1.95 }
      product { FactoryGirl.create(:product, :hot_tea) }
      product_size { FactoryGirl.create(:product_size, :grande) }
    end
  end
end