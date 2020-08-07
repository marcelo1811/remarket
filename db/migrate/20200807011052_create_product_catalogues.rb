class CreateProductCatalogues < ActiveRecord::Migration[6.0]
  def change
    create_table :product_catalogues do |t|
      t.references :product, null: false, foreign_key: true
      t.references :catalogue, null: false, foreign_key: true
      t.bigint :comission

      t.timestamps
    end
  end
end
