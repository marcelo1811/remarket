class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.bigint :price
      t.integer :sku

      t.timestamps
    end
  end
end
