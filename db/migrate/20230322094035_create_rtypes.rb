class CreateRtypes < ActiveRecord::Migration[7.0]
  def change
    create_table :rtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
