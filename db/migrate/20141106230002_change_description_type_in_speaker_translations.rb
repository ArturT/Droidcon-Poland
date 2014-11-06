class ChangeDescriptionTypeInSpeakerTranslations < ActiveRecord::Migration
  def up
   change_column :speaker_translations, :description, :text
  end

  def down
   change_column :speaker_translations, :description, :string
  end
end
