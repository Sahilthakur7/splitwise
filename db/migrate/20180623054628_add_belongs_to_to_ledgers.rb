class AddBelongsToToLedgers < ActiveRecord::Migration[5.1]
  def change
      change_table :ledgers do |t|
          t.belongs_to :group , index: true
      end
  end
end
