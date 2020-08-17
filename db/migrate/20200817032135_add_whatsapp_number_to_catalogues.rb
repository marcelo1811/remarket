class Addwhatsapp_numberNumberToCatalogues < ActiveRecord::Migration[6.0]
  def change
    add_column :catalogues, :whatsapp_number, :string
  end
end
