class CreateUserContractIdeas < ActiveRecord::Migration

  def change
  	add_column :user_contract_ideas, :title, :string
  	add_column :user_contract_ideas, :description, :text
  	add_column :user_contract_ideas, :code, :text
  end

end
