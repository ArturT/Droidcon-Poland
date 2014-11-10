ActiveAdmin.register Brand do
  scope :all, default: true
  Brand::CATEGORIES.each do |category|
    scope category
  end

  index do
    column :category
    column :name
    column :image do |brand|
      image_tag brand.image.thumb
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :category, as: :select, collection: Brand::CATEGORIES.map{ |v| [v,v] }
      f.input :name
      f.input :image
      f.input :remove_image, as: :boolean
    end
    f.actions
  end
end
