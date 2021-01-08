class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :book, foreign_key: true
      t.references :order, foreign_key: true
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
