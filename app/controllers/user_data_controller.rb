class UserDataController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_datum

  # GET /user_data
  def show
    render "user_data/show"
  end

  def create
    update
  end

  # PATCH/PUT /user_data/1
  def update
    if @user_datum.update(user_datum_params)
      render "user_data/show"
    else
      render json: {success: false,  errors: @user_datum.errors, status: :unprocessable_entity}
    end
  end

  private
    def set_user_datum
      @user_datum = UserDatum.find_by_user_id(current_user.id)
      create_user_datum if @user_datum.nil?
    end

    def create_user_datum
      @user_datum = UserDatum.new(user_datum_params)
      @user_datum.user_id = current_user.id
      if @user_datum.save
        render :show, status: :created, location: @user_datum
      else
        render json: {success: false,  errors: @user_datum.errors, status: :unprocessable_entity}
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_datum_params
      params.permit(
        :user_datum, :user_id, :birthday, :heigh,:country, :sex, :body_frame, :weigh_unit, :heigh_unit, :energy_unit, :lifestyle
      )
    end
end
