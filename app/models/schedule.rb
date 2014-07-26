class Schedule < ActiveRecord::Base
  include ScheduleTimeValidator

  translates :topic, :description
  globalize_accessors

  just_define_datetime_picker :start_time
  just_define_datetime_picker :end_time

  belongs_to :speaker
  belongs_to :room

  scope :with_time, -> { where('start_time IS NOT NULL AND end_time IS NOT NULL') }
  scope :start_time_asc, -> { order('start_time ASC') }

  #validates :start_time, presence: true
  #validates :end_time, presence: true
  #validates :speaker, presence: true
  validates :room, presence: true

  def self.last_updated
    select('updated_at').order('updated_at DESC').limit(1).first.try(:updated_at)
  end
end
