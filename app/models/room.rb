class Room < ActiveRecord::Base
  translates :name

  has_many :schedules, dependent: :destroy

  validates :name_pl, presence: true
  validates :name_en, presence: true

  def name
    if I18n.locale == :en
      name_en
    else
      name_pl
    end
  end
end
