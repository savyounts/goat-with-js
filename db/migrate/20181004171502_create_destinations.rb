class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :image_url
      t.text :description
      t.integer :creator_id
      t.text :must_dos
      t.text :day_trips
      t.text :dont_dos

      t.timestamps
    end
  end
end
