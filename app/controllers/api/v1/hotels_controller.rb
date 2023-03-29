module Api
  module V1
    class HotelsController < ApplicationController
      def index
        render json: {'message': 'hello_world'}
      end
    end
  end
end