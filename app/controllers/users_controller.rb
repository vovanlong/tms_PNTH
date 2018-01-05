class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update)
  before_action :correct_user, only: %i(edit update)
  before_action :find_user, only: %i(show)

  def index
    @users = User.desc_created_at.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @courses = current_user.courses.created_desc
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = I18n.t "controllers.user_controller.update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :school, :picture
  end
end
