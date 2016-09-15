class AddUserReferenceToUserContracts < ActiveRecord::Migration
  def change
    add_reference :user_contracts, :user, index: true, foreign_key: true
  end
end
