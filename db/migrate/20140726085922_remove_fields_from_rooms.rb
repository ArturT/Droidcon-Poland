class RemoveFieldsFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :name_pl, :string, null: false
    remove_column :rooms, :name_en, :string, null: false
  end
end
