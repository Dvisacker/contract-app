class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :body
      t.integer :challenge_id
      t.string :code
      t.string :hint1
      t.string :hint2
      t.integer :user_viewcount

      t.timestamps null: false
    end
  end
end
