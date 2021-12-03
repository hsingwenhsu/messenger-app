class PrivatesController < ApplicationController
  before_action :set_private, only: [:show, :edit, :update, :destroy]

  # GET /privates
  # GET /privates.json
  def index
    @privates = Private.all
  end

  # GET /privates/1
  # GET /privates/1.json
  def show
    #@privates = Private.find_by("admin_id1 = ? OR admin_id2 = ?", current_admin.id, current_admin.id)
    @privates = Private.where(:admin_id2 => current_admin.id).or(Private.where(:admin_id1 => current_admin.id ))
  end

  # GET /privates/new
  def new
    @private = Private.new
  end

  # GET /privates/1/edit
  def edit
  end

  # POST /privates
  # POST /privates.json
  def create
    @private = Private.find_by(admin_id1: private_params[:admin_id1], admin_id2: private_params[:admin_id2])
    if @private == nil
      @private = Private.find_by(admin_id1: private_params[:admin_id2], admin_id2: private_params[:admin_id1])
    end
    if @private == nil
      @private = Private.new(private_params)
    end

    respond_to do |format|
      if @private.save
        format.html { redirect_to @private, notice: 'Private was successfully created.' }
        format.json { render :show, status: :created, location: @private }
      else
        format.html { render :new }
        format.json { render json: @private.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privates/1
  # PATCH/PUT /privates/1.json
  def update
    respond_to do |format|
      if @private.update(private_params)
        format.html { redirect_to @private, notice: 'Private was successfully updated.' }
        format.json { render :show, status: :ok, location: @private }
      else
        format.html { render :edit }
        format.json { render json: @private.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privates/1
  # DELETE /privates/1.json
  def destroy
    @private.destroy
    respond_to do |format|
      format.html { redirect_to privates_url, notice: 'Private was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private
      @private = Private.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_params
      params.require(:private).permit(:admin_id1, :admin_id2, :admin_name1, :admin_name2)
    end
end
