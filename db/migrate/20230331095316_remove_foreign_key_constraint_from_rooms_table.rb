class RemoveForeignKeyConstraintFromRoomsTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :rooms, :hotels
  end
end
