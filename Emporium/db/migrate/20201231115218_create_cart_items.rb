class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :book, foreign_key: true
      t.references :cart, foreign_key: true
      t.float :price
      t.integer :amount
      t.datetime :created_at

      t.timestamps
    end
  end
end
