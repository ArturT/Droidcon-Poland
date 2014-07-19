class Speaker < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :schedules, dependent: :destroy

  scope :speakers, includes(:schedules).where(organizer: false).order('name ASC')
  scope :organizers, where(organizer: true).order('name ASC')

  validates :name, presence: true
  #validates :description_pl, presence: true
  #validates :description_en, presence: true

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end
end
