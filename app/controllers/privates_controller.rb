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
    @private = Private.new(private_params)

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
      params.fetch(:private, {})
    end
end
