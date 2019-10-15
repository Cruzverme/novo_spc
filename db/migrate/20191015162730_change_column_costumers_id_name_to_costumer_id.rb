class ChangeColumnCostumersIdNameToCostumerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :billings, :costumers_id, :costumer_id
  end
end
