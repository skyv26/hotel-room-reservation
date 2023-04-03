class Api::V1::RoomsController < ApplicationController
  before_action :search_room, only: [:show, :update, :destroy]
  protect_from_forgery with: :null_session

  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end

  def new
    Room.new
  end

  def create
    @room = Room.new(room_params.except('photos_array'))
    if @room.save
      params["photos_array"].each do |obj|
        RoomPhoto.create(photo_path: obj, room_id: @room.id)
      end
      render json: { message: 'Room Added Successfully', status: :created, response_code: 201}
    else
      puts "#{@room.errors.messages}"
      render json: { message: "All fields are required", status: :not_acceptable, response_code: 406, }
    end
  end

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
    params.permit(:description, :price_per_night, :hotel_id, :photos_array)
  end
end