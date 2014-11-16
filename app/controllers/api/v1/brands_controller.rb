module API
  module V1
    class BrandsController < ApplicationController
      def index
        render json: Brand.all
      end
    end
  end
end
