class AddCostumerToBillings < ActiveRecord::Migration[5.2]
  def change
    add_reference :billings, :costumers, foreign_key: true
  end
end
