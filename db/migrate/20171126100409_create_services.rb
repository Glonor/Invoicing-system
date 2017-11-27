class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :invoice, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :amount, precision: 20, scale: 4

      t.timestamps
    end
  end
end
