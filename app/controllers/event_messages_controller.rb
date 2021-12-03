class EventMessagesController < ApplicationController
  before_action :set_event_message, only: [:show, :edit, :update, :destroy]

  # GET /event_messages
  # GET /event_messages.json
  def index
    @event_messages = EventMessage.all
  end

  # GET /event_messages/1
  # GET /event_messages/1.json
  def show
  end

  # GET /event_messages/new
  def new
    @event_message = EventMessage.new
  end

  # GET /event_messages/1/edit
  def edit
  end

  # POST /event_messages
  # POST /event_messages.json
  def create
    @event_message = EventMessage.new(event_message_params)
    @event_message.admin = current_admin
    @event_message.save
    SendEventMessageJob.perform_later(@event_message)
  end

  # PATCH/PUT /event_messages/1
  # PATCH/PUT /event_messages/1.json
  def update
    respond_to do |format|
      if @event_message.update(event_message_params)
        format.html { redirect_to @event_message, notice: 'Event message was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_message }
      else
        format.html { render :edit }
        format.json { render json: @event_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_messages/1
  # DELETE /event_messages/1.json
  def destroy
    @event_message.destroy
    respond_to do |format|
      format.html { redirect_to event_messages_url, notice: 'Event message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_message
      @event_message = EventMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_message_params
      params.require(:event_message).permit(:content, :admin_id, :event_id)
    end
end
