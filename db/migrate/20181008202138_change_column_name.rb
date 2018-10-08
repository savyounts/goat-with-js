class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :name, :occasion
  end
end
