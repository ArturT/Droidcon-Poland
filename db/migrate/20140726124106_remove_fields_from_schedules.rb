class RemoveFieldsFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :topic_pl, :string, null: true
    remove_column :schedules, :topic_en, :string, null: true
    remove_column :schedules, :description_pl, :text, null: true
    remove_column :schedules, :description_en, :text, null: true
  end
end
