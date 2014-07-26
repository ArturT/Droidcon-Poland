class RemoveFieldsFromSpeakers < ActiveRecord::Migration
  def change
    remove_column :speakers, :description_pl, :string, null: true
    remove_column :speakers, :description_en, :string, null: true
  end
end
