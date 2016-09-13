class FakeConversationMigration < ActiveRecord::Migration

  def self.up
	create_table "conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end
end

  #Indexes
  def self.down
    drop_table :conversations
  end

end
