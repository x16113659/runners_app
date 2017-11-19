class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :name
      t.string :manufacturer
      t.decimal :price
      t.string :colour
      t.string :size
      t.decimal :discount
      t.text :description
      t.string :picture
      t.decimal :popularity
      t.integer :stock
      t.integer :hold

      t.timestamps
    end
  end
end
