class RemoveRoomIdFromRoomPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_column :room_photos, :room_id, :string
  end
end
