class CreateUserContracts < ActiveRecord::Migration
  def change
    create_table :user_contracts do |t|
      t.string :title
      t.text :description
      t.text :code
      t.text :solution_description
      t.string :contract_adress

      t.timestamps null: false
    end
  end
end
