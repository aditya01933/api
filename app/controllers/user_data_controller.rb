class UserDataController < ApplicationController
  before_action :authenticate_user!

  # GET /user_data
  def index
    render json: {}
  end

  def show
    @user_datum = UserDatum.find('user_id = ?', current_user.id)
  rescue ActiveRecord::RecordNotFound
    create
  end

  def create
    @user_datum = UserDatum.find(params[:id])
    render :show, status: :created, location: @user_datum
  rescue ActiveRecord::RecordNotFound
    @user_datum = Weighing.new(user_datum_params)
    @user_datum.user_id = current_user.id

    if @user_datum.save
      render :show, status: :created, location: @user_datum
    else
      render json: {success: false,  errors: @user_datum.errors, status: :unprocessable_entity}
    end
  end

  # PATCH/PUT /user_data/1
  def update
    @user_datum = UserDatum.find(params[:id])
    if @user_datum.user_id == current_user.id and @user_datum.update(user_datum_params)
      render "user_data/show"
    else
      render json: {success: false,  errors: @user_datum.errors, status: :unprocessable_entity}
    end
  rescue ActiveRecord::RecordNotFound
    create
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_datum_params
      params.require(:user_datum).permit(
        :user_datum, :user_id, :birthday, :heigh,:country, :sex, :body_frame, :weigh_unit, :heigh_unit, :energy_unit, :lifestyle
      )
    end
end
