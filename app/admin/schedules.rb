ActiveAdmin.register Schedule do
  controller do
    def scoped_collection
      super.includes :translations
    end
  end

  scope :start_time_asc, default: true

  index do
    column :speaker
    column :room_id do |schedule|
      schedule.room.name unless schedule.room.blank?
    end
    I18n.available_locales.each do |locale|
      column :"topic_#{locale}"
      column :"description_#{locale}"
    end
    column :start_time
    column :end_time
    actions
  end

  form do |f|
    f.inputs do
      f.input :speaker
      f.input :room
      I18n.available_locales.each do |locale|
        f.input :"topic_#{locale}"
        f.input :"description_#{locale}"
      end
      f.input :start_time, as: :just_datetime_picker
      f.input :end_time, as: :just_datetime_picker
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
