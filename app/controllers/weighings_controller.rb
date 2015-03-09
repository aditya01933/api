class WeighingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weighing, only: [:show, :edit, :update, :destroy]

  def index
    @weighings = Weighing.where('user_id = ?', current_user.id)
    render "weighings/index"
  end

  def show
    if @weighing.user_id == current_user.id
      render "weighings/show"
    else
      render json: {
        success: false,
        errors: ["weighing not found"]
      }, status: 404
    end
  end

  # POST /weighings
  def create
    @weighing = Weighing.new(weighing_params)
    @weighing.user_id = current_user.id
    respond_to do |format|
      if @weighing.save
        format.json { render :show, status: :created, location: @weighing }
      else
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weighings/1
  # PATCH/PUT /weighings/1.json
  def update
    respond_to do |format|
      if @weighing.update(weighing_params)
        format.html { redirect_to @weighing, notice: 'Weighing was successfully updated.' }
        format.json { render :show, status: :ok, location: @weighing }
      else
        format.html { render :edit }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weighings/1
  def destroy
    @weighing.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weighing
      @weighing = Weighing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weighing_params
      params.require(:weighing).permit(
          :weighing, :id, :weigh, :body_fat, :body_water, :muscle_mass, :physique_rating,
          :basal_metabolic_rate, :metabolic_age, :bone_mass, :viscerial_fat,
          :comment, :image, :created_at, :updated_at
      )
    end
end
