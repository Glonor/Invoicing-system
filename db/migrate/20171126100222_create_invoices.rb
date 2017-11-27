class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.datetime :issue_date
      t.decimal :total_amount, precision: 20, scale: 4

      t.timestamps
    end
  end
end
