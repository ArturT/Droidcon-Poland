class RemoveFieldsFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :topic_pl, :string, null: true
    remove_column :schedules, :topic_en, :string, null: true
    remove_column :schedules, :description_pl, :string, null: true
    remove_column :schedules, :description_en, :string, null: true
  end
end
