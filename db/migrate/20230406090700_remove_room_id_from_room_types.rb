class RemoveRoomIdFromRoomTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :room_types, :room_id, :string
  end
end
