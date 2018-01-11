module Supervisor
  class UserCoursesController < ApplicationController
    before_action :check_params
    before_action :logged_in_user
    before_action :admin_user

    def create
      @course.assign_user @user
      redirect_to edit_supervisor_course_path(@course)
    end

    def destroy
      @course.remove_user @user
      redirect_to edit_supervisor_course_path(@course)
    end

    private

    def check_params
      @user = User.find_by id: params[:user_id]
      @course = Course.find_by id: params[:course_id]
      if @user && !@course
        flash[:danger] = t "supervisor.courses.add_user.course_not_found"
        redirect_to new_supervisor_course_path
      end
      return if @course || @user
      flash[:danger] = t "error"
      redirect_to supervisor_users_path
    end

    def course_subjects_params
      params.require(:user_courses).permit :course_id, :user_id
    end
  end
end
