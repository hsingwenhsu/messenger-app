class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  helper_method :enrollments
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.admin = current_admin
    @enrollment.save
    # respond_to do |format|
    #   if @enrollment.save
    #     format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
    #     format.json { render :show, status: :created, location: @enrollment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @enrollment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    # respond_to do |format|
    #   format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      #params.fetch(:enrollment, {})
      # params.require(:enrollment).permit(:content, :admin_id, :room_id)
      params.require(:enrollment).permit(:admin_id, :room_id)
    end
end
