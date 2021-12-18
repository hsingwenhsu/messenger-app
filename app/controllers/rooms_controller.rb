class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  helper_method :rooms
  # GET /rooms
  # GET /rooms.json
  def index
    # @rooms = Room.all
    @rooms = Room.search(params[:search])
  end

  # def search
  #   if params[:search].blank?
  #     @rooms = Room.all
  #   else
  #     @search_param = params[:search].downcase
  #     @rooms = Room.all.where("lower(name) LIKE :search", search: "%#{@search_param}")
  #   end
  # end
    # GET /rooms/1
  # GET /rooms/1.json
  def show
    @rooms = Room.all
    id = params[:id]
    @single_room = Room.find(id)
    #render 'index'
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      @room.save
      format.html { redirect_to @room, notice: 'Room was successfully created.' }
      format.json { render :show, status: :created, location: @room }
      # if @room.save
      #   format.html { redirect_to @room, notice: 'Room was successfully created.' }
      #   format.json { render :show, status: :created, location: @room }
      # else
      #   format.html { render :new }
      #   format.json { render json: @room.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      @room.update(room_params)
      format.html { redirect_to @room, notice: 'Room was successfully updated.' }
      format.json { render :show, status: :ok, location: @room }
      # if @room.update(room_params)
      #   format.html { redirect_to @room, notice: 'Room was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @room }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @room.errors, status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  # def destroy
  #   @room.destroy
  #   respond_to do |format|
  #     format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name)
    end
end
