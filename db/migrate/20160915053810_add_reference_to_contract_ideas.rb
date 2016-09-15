class AddReferenceToContractIdeas < ActiveRecord::Migration
  def change
	add_reference :user_contract_ideas, :user, index: true, foreign_key: true
  end
end
