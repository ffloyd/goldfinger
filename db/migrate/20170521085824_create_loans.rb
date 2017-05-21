class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.references :company, foreign_key: true, null: false
      t.integer :amount_cents, null: false, default: 0
      t.integer :months, null: false, default: 1
      t.integer :period, null: false, default: 1
      t.decimal :rate, precision: 3, scale: 2, null: false, default: 0.3
      t.decimal :extra_rate, precision: 3, scale: 2, null: false, default: 0.5

      t.timestamps
    end
  end
end
