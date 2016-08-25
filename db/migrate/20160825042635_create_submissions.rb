class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :project_id
      t.integer :key
      t.integer :challenge_id
      t.string :submission_text
      t.datetime :submission_time
      t.boolean :complete
      t.integer :user_id
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
