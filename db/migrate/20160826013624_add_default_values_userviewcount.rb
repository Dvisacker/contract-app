class AddDefaultValuesUserviewcount < ActiveRecord::Migration
  def change
  	change_column :challenges, :user_viewcount, :integer, :default => 0 
  end
end
