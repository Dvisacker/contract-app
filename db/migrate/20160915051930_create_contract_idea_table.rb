class CreateContractIdeaTable < ActiveRecord::Migration
  def change
    create_table :user_contract_ideas do |t|
      t.string :title
      t.text :description
      t.text :code
      t.text :solution_description

      t.timestamps null: false
    end
  end
end
