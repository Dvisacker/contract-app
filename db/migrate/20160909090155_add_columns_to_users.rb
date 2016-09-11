class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :country, :string
  	add_column :users, :adress, :string
  end
end
