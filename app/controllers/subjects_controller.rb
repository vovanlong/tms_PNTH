class SubjectsController < ApplicationController
  before_action :load_subject, only: %i(show)

  def show
    @tasks = @subject.tasks
  end

  private

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:danger] = I18n.t "courses.load_subject.not_found"
    redirect_to root_path
  end
end
