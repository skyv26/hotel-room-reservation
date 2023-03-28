class AddRoomIdToRoomPhoto < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_photos, :room, null: false, foreign_key: true
  end
end
