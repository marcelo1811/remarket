class CreateCatalogueStores < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogue_stores do |t|
      t.references :catalogue, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
