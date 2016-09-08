class ChangeColumnCompleteInSubmissions < ActiveRecord::Migration
  def change
  	remove_column :submissions, :complete
  	add_column :submissions, :status, :string, default: 'waiting'
  end
end
