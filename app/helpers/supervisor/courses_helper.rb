module Supervisor
  module CoursesHelper
    def load_subject_form course, subject
      course.course_subjects.find_by(subject_id: subject.id)
    end

    def load_user_form course, trainee
      course.user_courses.find_by(user_id: trainee.id)
    end
  end
end
