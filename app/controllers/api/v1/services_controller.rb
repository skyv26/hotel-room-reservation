module Api
  module V1
    class ServicesController < ApplicationController
      before_action :search_service, only: [:show, :update, :destroy]
      protect_from_forgery with: :null_session

      def index
        @services = Service.all
        render json: @services, status: :ok
      end

      def new
        Service.new
      end

      def create
        @service = Service.new(service_params)
        if @service.save
          render json: { message: 'Service Added Successfully', status: :created, response_code: 201}
        else
          render json: { message: "All fields are required", status: :not_acceptable, response_code: 406, }
        end
      end

      def show
        render json: @service
      end

      def update
        @service.update(service_params)
        render json: @service, status: :ok
      end

      def destroy
        @service.delete
        render json: @service, status: :ok
      end

      private

      def search_service
        @service = Service.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { message: 'Service not found', status: :not_found, response_code: 404 }
      end

      def service_params
        params.require(:service).permit(:name, :icon)
      end
    end
  end
end