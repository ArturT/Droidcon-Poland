class AddDescriptionToSpeakers < ActiveRecord::Migration
  def up
    Speaker.create_translation_table! description: { type: :string, null: true }
  end

  def down
    Speaker.drop_translation_table!
  end
end
