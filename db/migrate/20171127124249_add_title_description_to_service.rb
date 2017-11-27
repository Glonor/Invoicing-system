class AddTitleDescriptionToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :title, :string
    add_column :services, :description, :text
  end
end
