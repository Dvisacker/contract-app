class ChangeDefaultValueUserIntro < ActiveRecord::Migration
  def change
  	change_column_default(:users, :intro, '')
  end
end
