class WeighingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weighing, only: [:show, :update, :destroy]
  before_action :can_change?,  only: [:show, :update, :destroy]

  def index
    @weighings = Weighing.where('user_id = ?', current_user.id)
    render "weighings/index"
  end

  def show
    render "weighings/show"
  end

  # POST /weighings
  def create
    @weighing = Weighing.new(weighing_params)
    @weighing.user_id = current_user.id

    if @weighing.save
      render :show, status: :created, location: @weighing
    else
      render json: {success: false,  errors: @weighing.errors, status: :unprocessable_entity}
    end
  end

  # PATCH/PUT /weighings/1
  def update
    if @weighing.update(weighing_params)
      render :show, status: :ok, location: @weighing
    else
      render json: {success: false,  errors: @weighing.errors, status: :unprocessable_entity}
    end
  end

  # DELETE /weighings/1
  def destroy
    @weighing = Weighing.find(params[:id])
    if @weighing.destroy
      render json: {success: true}, status: :ok, head: :no_content
    else
      render json: {success: false,  errors: @weighing.errors, status: :unprocessable_entity}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weighing
      @weighing = Weighing.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weighing_params
      params.require(:weighing).permit(
          :weighing, :id, :weigh, :body_fat, :body_water, :muscle_mass, :physique_rating,
          :basal_metabolic_rate, :metabolic_age, :bone_mass, :viscerial_fat,
          :comment, :image, :created_at, :updated_at
      )
    end

    def can_change?
      @can_change = @weighing.user_id == current_user.id
      render_404 if !@can_change
      return @can_change
    end

    def render_404
      render json: {
        success: false,
        errors: ["weighing not found"]
      }, status: 404
    end
end
