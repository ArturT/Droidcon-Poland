class AddNameToRooms < ActiveRecord::Migration
  def up
    Room.create_translation_table! name: { type: :string, null: false }
  end

  def down
    Room.drop_translation_table!
  end
end
