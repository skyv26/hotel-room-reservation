module Api
  module V1
    class HotelsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        @hotels = Hotel.all
        render json: @hotels, status: :ok
      end

      def new
        Hotel.new
      end

      def create
        @hotel = Hotel.new(hotel_params)
        if @hotel.save
          render json: { message: 'Successfully added the Hotel', status: :created, response_code: 200 }
        else
          # render json: { message: "'name' or 'address' field is required !", status: :not_acceptable,
          #                response_code: 406 }
          render json: { message: "'name' or 'address' field is required !", status: :not_acceptable,
                         response_code: 406 }, status: :not_acceptable
        end
      end

      def show
        @hotel = search_hotel
        render json: @hotel
      end

      def update
        @hotel = search_hotel
        @hotel.update(hotel_params)
        render json: @hotel, status: :ok
      end

      def destroy
        @hotel = search_hotel
        @hotel.delete
        render json: @hotel, status: :ok
      end

      private

      def search_hotel
        Hotel.find(params[:id])
      rescue StandardError
        render json: { message: 'data not found !!', status: :not_found, response_code: 404 }
      end

      def hotel_params
        params.require(:hotel).permit(:name, :address)
      end
    end
  end
end
