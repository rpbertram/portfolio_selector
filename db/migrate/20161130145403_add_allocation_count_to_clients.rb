class AddAllocationCountToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :allocations_count, :integer
  end
end
