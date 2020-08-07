class CreateVariations < ActiveRecord::Migration[6.0]
  def change
    create_table :variations do |t|
      t.string :name
      t.bigint :price

      t.timestamps
    end
  end
end
