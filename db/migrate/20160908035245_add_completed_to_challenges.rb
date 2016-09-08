class AddCompletedToChallenges < ActiveRecord::Migration
  def change
  	add_column :challenges, :completed, :boolean, default: false
  end
end
