class RemoveTimeCreatedFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :time_created, :datetime
  end
end
