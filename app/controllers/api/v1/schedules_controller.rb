module API
  module V1
    class SchedulesController < ApplicationController
      before_action :load_schedules

      def index
        render json: @schedules
      end

      def extra
        render json: SchedulePresenter.as_json_array(@schedules)
      end

      private

      def load_schedules
        @schedules = Schedule.all
      end
    end
  end
end
