# Create two category for coffee and tea  
coffee = Category.create(name: 'Coffee')
tea = Category.create(name: 'Tea')

# Create products of the shop
espresso = Product.create(name: 'Espresso', category_id: coffee.id)
latte = Product.create(name: 'Latte', category_id: coffee.id)
cappuccino = Product.create(name: 'Cappuccino', category_id: coffee.id)

green_tea = Product.create(name: 'Green Tea', category_id: tea.id)
hot_tea = Product.create(name: 'Hot Tea', category_id: tea.id)

# Create product's sizes
tall = ProductSize.create(name: 'Tall')
grande = ProductSize.create(name: 'Grande')
venti = ProductSize.create(name: 'Venti')

# Create menu of the shop
ShopMenu.create(product_id: espresso.id, product_size_id: tall.id, price: 1.95)
ShopMenu.create(product_id: espresso.id, product_size_id: grande.id, price: 2.05)
ShopMenu.create(product_id: espresso.id, product_size_id: venti.id, price: 2.35)

ShopMenu.create(product_id: latte.id, product_size_id: tall.id, price: 3.4)
ShopMenu.create(product_id: latte.id, product_size_id: grande.id, price: 4.45)
ShopMenu.create(product_id: latte.id, product_size_id: venti.id, price: 4.65)

ShopMenu.create(product_id: cappuccino.id, product_size_id: tall.id, price: 3.15)
ShopMenu.create(product_id: cappuccino.id, product_size_id: grande.id, price: 3.75)
ShopMenu.create(product_id: cappuccino.id, product_size_id: venti.id, price: 4.15)

ShopMenu.create(product_id: green_tea.id, product_size_id: tall.id, price: 3.45)
ShopMenu.create(product_id: green_tea.id, product_size_id: grande.id, price: 4.25)
ShopMenu.create(product_id: green_tea.id, product_size_id: venti.id, price: 4.45)

ShopMenu.create(product_id: hot_tea.id, product_size_id: grande.id, price: 1.95)