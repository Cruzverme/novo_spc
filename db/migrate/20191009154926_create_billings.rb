class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :number_titulo
      t.string :expiration_date
      t.string :status_pago
      t.string :value
      t.boolean :status_billing

      t.timestamps
    end
  end
end
