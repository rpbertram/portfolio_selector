class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :client_id
      t.integer :fund_id
      t.float :percentage

      t.timestamps

    end
  end
end
