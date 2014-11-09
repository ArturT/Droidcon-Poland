namespace :app do
  desc "Clean up - it will remove rooms, speakers and schedules"
  task clean: :environment do
    Room.destroy_all
    Speaker.destroy_all
    Schedule.destroy_all
  end
end
