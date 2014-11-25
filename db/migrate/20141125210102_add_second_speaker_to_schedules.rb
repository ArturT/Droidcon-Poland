class AddSecondSpeakerToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :second_speaker_id, :integer
  end
end
