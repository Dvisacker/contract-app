class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true
      t.string :replies
      t.datetime :timestamp

      t.timestamps null: false
    end
  end
end
