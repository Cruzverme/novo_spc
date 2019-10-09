class AddBillingToCostumers < ActiveRecord::Migration[5.2]
  def change
    add_reference :costumers, :billing, foreign_key: true
  end
end
