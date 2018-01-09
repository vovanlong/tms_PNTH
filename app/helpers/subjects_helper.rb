module SubjectsHelper
  def get_status status
    if status.blank?
      fa_icon("circle task_init", id: "task_init")
    elsif status.doing?
      fa_icon("circle task_doing", id: "task_doing")
    else
      fa_icon("circle task_done", id: "task_done")
    end
  end
end
