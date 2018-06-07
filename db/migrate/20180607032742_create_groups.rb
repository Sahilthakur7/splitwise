class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :members_count
      t.float :total_spent

      t.timestamps
    end
  end
end
