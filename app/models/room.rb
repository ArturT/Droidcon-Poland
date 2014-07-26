class Room < ActiveRecord::Base
  translates :name
  globalize_accessors

  has_many :schedules, dependent: :destroy

  validates :name, presence: true
end
