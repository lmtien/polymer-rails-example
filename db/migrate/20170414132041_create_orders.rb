class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :shop_menu, index: true, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
