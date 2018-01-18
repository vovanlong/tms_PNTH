class UserTasksController < ApplicationController
  before_action :check_status, only: %i(create update)

  def new; end

  def create
    check_params_create
    @user_task = current_user.add_task(@user_id, @task_id, @status)
    return_page
  end

  def update
    load_user_task
    @user_task.update_attribute :status, params[:status]
    return_page
  end

  private

  def load_user_task
    @user_task = UserTask.find_by id: params[:id]
    return if @user_task
    flash[:danger] = t "error"
    redirect_to root_path
  end

  def check_status
    @status = params[:status]
    redirect_to root_path unless @status
  end

  def check_params_create
    @task_id = params[:task_id]
    @user_id = params[:user_id]
    return if @task_id && @user_id
    flash[:danger] = t "error"
    redirect_to root_path
  end

  def return_page
    respond_to do |format|
      format.html{course_subject_path}
      format.js
    end
  end
end
