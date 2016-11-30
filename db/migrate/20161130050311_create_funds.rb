class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name
      t.string :risktolerance
      t.integer :proxyflag

      t.timestamps

    end
  end
end
