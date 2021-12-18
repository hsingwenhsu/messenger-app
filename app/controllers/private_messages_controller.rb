class PrivateMessagesController < ApplicationController
  before_action :set_private_message, only: [:show, :edit, :update, :destroy]

  # GET /private_messages
  # GET /private_messages.json
  def index
    @private_messages = PrivateMessage.all
  end

  # GET /private_messages/1
  # GET /private_messages/1.json
  def show
  end

  # GET /private_messages/new
  # def new
  #   @private_message = PrivateMessage.new
  # end

  # GET /private_messages/1/edit
  def edit
  end

  # POST /private_messages
  # POST /private_messages.json
  def create
    @private_message = PrivateMessage.new(private_message_params)
    puts 'private_message params'
    puts private_message_params
    puts @private_message
    # @private_message.user = current_user
    @private_message.admin = current_admin
    @private_message.save

    SendPrivateMessageJob.perform_later(@private_message)
  end
  #   @private_message = PrivateMessage.new(private_message_params)

  #   respond_to do |format|
  #     if @private_message.save
  #       format.html { redirect_to @private_message, notice: 'Private message was successfully created.' }
  #       format.json { render :show, status: :created, location: @private_message }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @private_message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /private_messages/1
  # PATCH/PUT /private_messages/1.json
  # def update
  #   respond_to do |format|
  #     if @private_message.update(private_message_params)
  #       format.html { redirect_to @private_message, notice: 'Private message was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @private_message }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @private_message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /private_messages/1
  # DELETE /private_messages/1.json
  # def destroy
  #   @private_message.destroy
  #   respond_to do |format|
  #     format.html { redirect_to private_messages_url, notice: 'Private message was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_message
      @private_message = PrivateMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_message_params
      params.require(:private_message).permit(:content, :private_id, :admin_id)
      #params.fetch(:private_message, {})
    end
end
