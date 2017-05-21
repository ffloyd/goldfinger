class AddPaymentsCountToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :payments_count, :integer, default: 0
  end
end
