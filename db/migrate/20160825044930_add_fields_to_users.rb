class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :boolean
    add_column :users, :user_id, :string
    add_column :users, :rating, :string
    add_column :users, :token, :string
  end
end
