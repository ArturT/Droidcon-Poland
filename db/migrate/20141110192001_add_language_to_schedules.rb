class AddLanguageToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :language, :string
  end
end
