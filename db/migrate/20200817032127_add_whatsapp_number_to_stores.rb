class Addwhatsapp_numberNumberToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :whatsapp_number, :string
  end
end
