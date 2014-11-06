ActiveAdmin.register Speaker do
  controller do
    def scoped_collection
      super.includes :translations
    end
  end

  scope :all, default: true

  scope :speakers do
    Speaker.speakers
  end

  scope :organizers do
    Speaker.organizers
  end

  index do
    column :name
    I18n.available_locales.each do |locale|
      column :"description_#{locale}"
    end
    column :organizer
    column :photo do |speaker|
      image_tag speaker.photo.thumb, size: '100x100'
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :name
      I18n.available_locales.each do |locale|
        f.input :"description_#{locale}", as: :text
      end
      f.input :organizer
      f.input :photo
      f.input :remove_photo, as: :boolean
    end
    f.actions
  end

  show do |o|
    attributes_table do
      o.attribute_names.each do |attr|
        row attr
      end
    end

    panel 'Translations' do
      attributes_table_for o.translations do
        o.translations.attribute_names.each do |attr|
          row attr
        end
      end
    end

    active_admin_comments
  end
end
