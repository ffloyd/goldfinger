class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true, null: false
      t.integer :amount_cents, null: false, default: 0

      t.timestamps
    end
  end
end
