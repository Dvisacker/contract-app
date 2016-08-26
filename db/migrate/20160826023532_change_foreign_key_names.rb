class ChangeForeignKeyNames < ActiveRecord::Migration
	# Added foreign to comments which refers to user and challenge
	# Remove the id called challenge_id and add one called author_id

  def change
  	remove_column :challenges, :challenge_id
  end
end
