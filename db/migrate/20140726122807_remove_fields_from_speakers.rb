class RemoveFieldsFromSpeakers < ActiveRecord::Migration
  def change
    remove_column :speakers, :description_pl, :string, null: false
    remove_column :speakers, :description_en, :string, null: false
  end
end
