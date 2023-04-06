class Api::V1::RoomsController < ApplicationController
  before_action :search_room, only: %i[show update destroy]
  protect_from_forgery with: :null_session

  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end

  def new
    Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      render json: { message: 'Room Added Successfully', status: :created, response_code: 201 }
    else
      puts @room.errors.messages.to_s
      render json: { message: 'All fields are required', status: :not_acceptable, response_code: 406 }
    end
  end

  # def create
  #   ActiveRecord::Base.transaction do
  #     @room = Room.new(room_params.except(:photos, :type, :services))
  #     params[:photos].each do |img_path|
  #      @room_photos =  RoomPhoto.new(photo_path: img_path, room_id: @room.id)
  #     end
  #     @room_type = RoomType.new(rtype_id: params[:type])
  #     params[:services].each do |service_id|
  #      @room_service = RoomService.new(services_id:, room_id: @room.id)
  #     end

  #     begin
  #       @room.save
  #       @room_photos.save
  #       @room_type.save
  #       @room_service.save
  #       render json: { message: 'Room Added Successfully', status: :created, response_code: 201}
  #     rescue => exception
  #       raise ActiveRecord::Rollback
  #       render json: { message: "All fields are required", status: :not_acceptable, response_code: 406, }
  #     end
  #   end
  # end

  def show
    render json: @room
  end

  def update
    @room.update(room_params)
    render json: @room, status: :ok
  end

  def destroy
    @room.delete
    render json: @room, status: :ok
  end

  private

  def search_room
    @room = Room.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Room not found', status: :not_found, response_code: 404 }
  end

  def room_params
    params.permit(:description, :price_per_night, :hotel_id, room_type_attributes: [:rtype])
  end
end
