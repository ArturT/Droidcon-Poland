ActiveAdmin.register Schedule do
  scope :start_time_asc, default: true

  index do
    column :speaker
    column :room_id do |schedule|
      schedule.room.name unless schedule.room.blank?
    end
    column :start_time
    column :end_time
    actions
  end

  form do |f|
    f.inputs do
      f.input :speaker
      f.input :room
      f.input :start_time, as: :just_datetime_picker
      f.input :end_time, as: :just_datetime_picker
    end

    f.actions
  end
end
