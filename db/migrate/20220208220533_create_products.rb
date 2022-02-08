class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url_image
      t.float :price
      t.integer :discount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
