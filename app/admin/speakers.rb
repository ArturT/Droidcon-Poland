ActiveAdmin.register Speaker do
  scope :all, default: true

  scope :speakers do
    Speaker.speakers
  end

  scope :organizers do
    Speaker.organizers
  end

  index do
    column :name
    column :organizer
    column :photo do |speaker|
      image_tag speaker.photo.thumb, size: '100x100'
    end
    actions
  end
end
