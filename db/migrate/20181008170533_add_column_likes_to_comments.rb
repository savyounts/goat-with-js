class AddColumnLikesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :likes, :integer, default:0
  end
end
