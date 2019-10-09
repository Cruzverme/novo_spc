class CreateCostumers < ActiveRecord::Migration[5.2]
  def change
    create_table :costumers do |t|
      t.string :name
      t.string :contract_number
      t.boolean :status_spc
      t.string :street
      t.string :streetNo

      t.timestamps
    end
  end
end
