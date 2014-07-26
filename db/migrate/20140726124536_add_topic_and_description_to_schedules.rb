class AddTopicAndDescriptionToSchedules < ActiveRecord::Migration
  def up
    Schedule.create_translation_table! topic: { type: :string, null: true }, description: { type: :text, null: true }
  end

  def down
    Schedule.drop_translation_table!
  end
end
