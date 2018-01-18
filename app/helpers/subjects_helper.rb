module SubjectsHelper
  def get_status object
    if object.blank?
      fa_icon("circle task_init")
    else
      fa_icon("circle task_#{object.status}")
    end
  end
end
