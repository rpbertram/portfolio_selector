class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :clientname
      t.integer :accountsize
      t.string :mgmt_fee
      t.string :risktolerance

      t.timestamps

    end
  end
end
