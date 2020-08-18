class AddWhatsappDddToCatalogues < ActiveRecord::Migration[6.0]
  def change
    add_column :catalogues, :whatsapp_ddd, :string
  end
end
