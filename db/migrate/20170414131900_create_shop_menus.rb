class CreateShopMenus < ActiveRecord::Migration
  def change
    create_table :shop_menus do |t|
      t.references :product, index: true, foreign_key: true
      t.references :product_size, index: true, foreign_key: true
      t.float :price

      t.timestamps null: false
    end
  end
end
