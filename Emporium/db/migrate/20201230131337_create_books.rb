class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher, foreign_key: true
      t.datetime :published_at
      t.string :isbn
      t.text :blurb
      t.integer :page_count
      t.float :price

      t.timestamps
    end
  end
end
