class RemoveTimestampFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :timestamp, :datetime
  end
end
