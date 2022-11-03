class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :contact_no
      t.string :address
      t.string :username
      t.boolean :active

      t.timestamps
    end
  end
end
