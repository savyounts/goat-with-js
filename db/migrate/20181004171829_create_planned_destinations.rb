class CreatePlannedDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_destinations do |t|

      t.timestamps
    end
  end
end
