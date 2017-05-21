class AddExtraToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :extra, :boolean, default: false
  end
end
