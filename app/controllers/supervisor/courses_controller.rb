module Supervisor
  class CoursesController < ApplicationController
    layout "supervisor_layout"
    before_action :load_course, except: %i(index new create)

    def index
      @courses = Course.created_desc.page(params[:page]).per_page(Settings.courses.per_page)
    end

    def show; end

    def new; end

    def create; end

    def update; end

    def destroy; end

    private

    def load_course
      @course = Course.find_by id: params[:id]
      return if @course
      flash[:danger] = I18n.t "error"
      redirect_to supervisor_courses_path
    end
  end
end
