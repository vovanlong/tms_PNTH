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

  def course_duration course
    (course.end_at - course.start_at).to_i
  end

  def picture_for object
    if object.picture?
      image_tag(object.picture.url, alt: object.name, class: "img-thumbnail")
    else
      case object.class.name
      when "User"
        image_tag("/assets/user_img.png", alt: object.name, class: "img-thumbnail")
      when "Course"
        image_tag("/assets/Courses_default.png", alt: object.name, class: "img-thumbnail")
      when "Subject"
        image_tag("/assets/subject_default.png", alt: object.name, class: "img-thumbnail")
      end
    end
  end
end
