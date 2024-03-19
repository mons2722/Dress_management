class CreateClothes < ActiveRecord::Migration[7.1]
  def change
    create_table :clothes do |t|
      t.string :name
      t.string :size
      t.string :color
      t.float :price
      t.string :material
      t.integer :stock
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
