class AddColumnsToUser < ActiveRecord::Migration
  def change
	add_column :users, :intro, :text, default: 'Hey there, I have not yet filled in my introduction'
	add_column :users, :number_of_comments, :integer, default: 0
	add_column :users, :number_of_submissions, :integer, default: 0
	add_column :users, :glass_confiscated, :float, default: 0  	
  end
end
