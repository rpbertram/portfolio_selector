class AddClientCountToAdvisors < ActiveRecord::Migration[5.0]
  def change
    add_column :advisors, :clients_count, :integer
  end
end
