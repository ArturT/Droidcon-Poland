module ScheduleTimeValidator
  extend ActiveSupport::Concern

  included do
    validate :valid_time
    validate :valid_time_day

    private

    def valid_time
      return unless start_time && end_time
      if start_time > end_time
        errors.add(:start_time, 'is greater than end time')
      end
    end

    def valid_time_day
      return unless start_time && end_time
      unless start_time.day == end_time.day
        errors.add(:start_time, 'start time day should be equal end time day')
      end

      unless start_time.month == end_time.month
        errors.add(:start_time, 'start time month should be equal end time month')
      end

      unless start_time.year == end_time.year
        errors.add(:start_time, 'start time year should be equal end time year')
      end
    end
  end
end
