ActiveAdmin.register Room do
  controller do
    def scoped_collection
      super.includes :translations
    end
  end

  index do
    column :id
    I18n.available_locales.each do |locale|
      column :"name_#{locale}"
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      I18n.available_locales.each do |locale|
        f.input :"name_#{locale}"
      end
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
