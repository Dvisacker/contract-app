class FixUserContractFields < ActiveRecord::Migration

	def change
		change_column :user_contracts, :description, :text
		change_column :user_contracts, :code, :text
	end
end
