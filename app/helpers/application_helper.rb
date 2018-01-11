module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def picture_for course
    if course.picture?
      image_tag(course.picture.url, alt: course.name, class: "img-thumbnail")
    else
      image_tag("/assets/default.png", alt: course.name, class: "img-thumbnail")
    end
  end
end
