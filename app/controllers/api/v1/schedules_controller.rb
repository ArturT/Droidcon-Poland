module API
  module V1
    class SchedulesController < ApplicationController
      def index
        render json: Schedule.all
      end
    end
  end
end
