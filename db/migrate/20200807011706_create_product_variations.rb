class CreateProductVariations < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variations do |t|
      t.string :type
      t.references :product, null: false, foreign_key: true
      t.references :variation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
