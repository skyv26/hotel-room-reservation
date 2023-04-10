class AddRoomForeignKeyConstraintToRoomServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_services, :room, on_delete: :cascade
  end
end
