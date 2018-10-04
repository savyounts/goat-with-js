class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :trip_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
