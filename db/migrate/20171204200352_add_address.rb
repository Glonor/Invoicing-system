class AddAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :fiscal_code, :string, limit: 16
    add_column :clients, :address, :string
    add_column :clients, :city, :string
    add_column :clients, :district, :string
    add_column :clients, :postal_code, :string
    add_column :clients, :phone, :string

    add_column :users, :fiscal_code, :string, limit: 16
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :postal_code, :string
    add_column :users, :phone, :string
  end
end
