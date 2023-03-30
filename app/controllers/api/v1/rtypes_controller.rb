class Api::V1::RtypesController < ApplicationController
    before_action :search_rtype, only: [:show, :update, :destroy]
    protect_from_forgery with: :null_session

    def index
      @rtype = Rtype.all
      render json: @rtype, status: :ok
    end

    def new
      Rtype.new
    end

    def create
      @rtype = Rtype.new(rtype_params)
      if @rtype.save
        render json: { message: 'Rtype Added Successfully', status: :created, response_code: 201}
      else
        render json: { message: "All fields are required", status: :not_acceptable, response_code: 406, }
      end
    end

    def show
      render json: @rtype
    end

    def update
      @rtype.update(rtype_params)
      render json: @rtype, status: :ok
    end

    def destroy
      @rtype.delete
      render json: @rtype, status: :ok
    end

    private

    def search_rtype
      @rtype = Rtype.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Rtype not found', status: :not_found, response_code: 404 }
    end

    def rtype_params
      params.require(:rtype).permit(:name)
    end
end
