class CreatePlannedDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_destinations do |t|
      t.integer :trip_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
