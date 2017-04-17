ActiveRecord::Schema.define(version: 20170414132041) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "shop_menu_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orders", ["shop_menu_id"], name: "index_orders_on_shop_menu_id"

  create_table "product_sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "shop_menus", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "product_size_id"
    t.float    "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "shop_menus", ["product_id"], name: "index_shop_menus_on_product_id"
  add_index "shop_menus", ["product_size_id"], name: "index_shop_menus_on_product_size_id"

end
