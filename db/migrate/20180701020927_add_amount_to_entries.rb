class AddAmountToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :amount, :integer
  end
end
