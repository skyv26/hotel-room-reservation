class RemoveRoomIdFromRoomServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :room_services, :room_id, :string
  end
end
