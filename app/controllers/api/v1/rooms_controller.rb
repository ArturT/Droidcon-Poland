module API
  module V1
    class RoomsController < ApplicationController
      def index
        render json: Room.all
      end
    end
  end
end
