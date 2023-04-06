class AddRoomForeignKeyConstraintToRoomPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_photos, :room, on_delete: :cascade
  end
end
