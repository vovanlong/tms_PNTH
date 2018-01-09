module Supervisor
  class CourseSubjectsController < ApplicationController
    before_action :check_params
    before_action :logged_in_user
    before_action :admin_user

    def create
      start_at = Date.parse(params[:course_subject][:start_at], "%m/%d/%Y")
      @course.add_sb @subject, start_at
      respond_to do |format|
        format.html{redirect_to edit_supervisor_course_path(@course)}
        format.js
      end
    end

    def destroy; end

    private

    def check_params
      @subject = Subject.find_by id: params[:subject_id]
      @course = Course.find_by id: params[:course_id]
      return if @course || @subject
      flash[:danger] = t "error"
      redirect_to root_path
    end

    def course_subjects_params
      params.require(:course_subjects).permit :course_id, :subject_id, :start_at
    end
  end
end
