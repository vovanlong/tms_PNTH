class TasksController < ApplicationController
  before_action :load_task, only: %i(edit update)

  def index
    # hien thi cac tasks cua user ung voi moi subject,em tam thoi de day roi se phan quyen sau
    @task_user_subject = current_user.tasks.get_task(params[:subject_id])
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new task_params
    if @task.save
      flash[:info] = I18n.t "tasks.create.success"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @task.update_attributes task_params
      flash[:success] = I18n.t "tasks.update.success"
      redirect_to root_path
    else
      flash[:danger] = I18n.t "tasks.update.failed"
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit :name, :description, :subject_id
  end

  def load_task
    @task = Task.find_by id: params[:id]
    return if @task
    flash[:danger] = I18n.t "tasks.load_subject.not_found"
    redirect_to root_path
  end
end
