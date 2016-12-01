class AddClientCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :clients_count, :integer
  end
end
