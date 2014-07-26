class Speaker < ActiveRecord::Base
  translates :description
  globalize_accessors

  mount_uploader :photo, PhotoUploader

  has_many :schedules, dependent: :destroy

  scope :speakers, -> { includes(:schedules).where(organizer: false).order('name ASC') }
  scope :organizers, -> { where(organizer: true).order('name ASC') }

  validates :name, presence: true
end
