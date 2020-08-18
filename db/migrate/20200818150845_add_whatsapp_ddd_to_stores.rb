class AddWhatsappDddToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :whatsapp_ddd, :string
  end
end
