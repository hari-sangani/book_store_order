class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :publisher, null: false, foreign_key: true
      t.string :title
      t.integer :isbndb
      t.date :publish_date
      t.string :language
      t.integer :mrp
      t.integer :discount
      t.integer :price
      t.integer :paperback
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
