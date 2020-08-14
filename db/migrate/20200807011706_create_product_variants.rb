class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :sku

      t.timestamps
    end
  end
end
