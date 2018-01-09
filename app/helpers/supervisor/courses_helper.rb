module Supervisor::CoursesHelper
  def load_subject_form course, subject
    course.course_subjects.find_by(subject_id: subject.id)
  end
end
