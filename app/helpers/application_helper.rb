module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def start_date course_subject
    course_subject.deadline - course_subject.subject.duration.days
  end
end
