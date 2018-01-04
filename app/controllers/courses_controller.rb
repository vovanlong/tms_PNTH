class CoursesController < ApplicationController
  before_action :load_course, except: %i(index new create)

  def index
    @courses = Course.all.created_desc.page(params[:page])
      .per_page(Settings.courses.per_page)
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:info] = I18n.t "courses.create.success"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes course_params
      flash[:success] = I18n.t "courses.update.success"
      redirect_to root_path
    else
      flash[:danger] = I18n.t "courses.update.failed"
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = I18n.t "courses.destroy.success"
      redirect_to courses_path
    else
      flash[:success] = I18n.t "courses.destroy.failed"
      redirect_to :back
    end
  end

  private

  def course_params
    params.require(:course).permit :name, :description, :status, :start_at, :end_at
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = I18n.t "courses.load_course.not_found"
    redirect_to root_path
  end
end
