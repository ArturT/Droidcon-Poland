module API
  module V1
    class SpeakersController < ApplicationController
      def index
        render json: Speaker.all
      end
    end
  end
end

