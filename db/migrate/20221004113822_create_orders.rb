class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :status
      t.boolean :active

      t.timestamps
    end
  end
end
