class Schedule < ActiveRecord::Base
  include ScheduleTimeValidator

  translates :topic, :description
  globalize_accessors

  just_define_datetime_picker :start_time
  just_define_datetime_picker :end_time

  belongs_to :speaker
  belongs_to :room

  scope :with_time, -> { where('start_time IS NOT NULL AND end_time IS NOT NULL') }
  scope :start_time_asc, -> { order('start_time ASC, room_id ASC') }

  validates :language,
    allow_blank: true,
    inclusion: { in: A9n.languages }

  def self.last_updated
    select('updated_at').order('updated_at DESC').limit(1).first.try(:updated_at)
  end

  def month_and_day
    start_time.to_s(:month_and_day)
  end

  def self.grouped_schedules
    ordered_schedules = with_time.start_time_asc
    grouped_schedules = ordered_schedules.group_by(&:month_and_day).sort
    grouped_schedules.map do |month_and_day, schedules|
      [month_and_day, schedules.group_by(&:start_time)]
    end
  end
end
