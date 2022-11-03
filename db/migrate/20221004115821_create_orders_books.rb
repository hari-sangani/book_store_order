class CreateOrdersBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_books do |t|
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :quantity
      t.integer :mrp
      t.integer :discount
      t.integer :price

      t.timestamps
    end
  end
end
