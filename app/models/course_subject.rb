class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  delegate :description, :name, :duration, :picture, to: :course, prefix: true
end
