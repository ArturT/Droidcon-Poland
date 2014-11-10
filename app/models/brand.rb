class Brand < ActiveRecord::Base
  CATEGORIES = %w(
    diamond
    gold
    silver
    bronze
    supporter
    partner
  )

  CATEGORIES.each do |category|
    scope category, -> { where(category: category) }
  end

  mount_uploader :image, ImageUploader

  validates :category,
    presence: true,
    inclusion: { in: CATEGORIES }
  validates :name, presence: true
end
