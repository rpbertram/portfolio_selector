class CreateHistoricalperformances < ActiveRecord::Migration
  def change
    create_table :historicalperformances do |t|
      t.integer :fund_id
      t.string :month
      t.float :performance

      t.timestamps

    end
  end
end
