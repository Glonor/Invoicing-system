class AddTariffToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :tariff, :decimal, precision: 20, scale: 4
  end
end
