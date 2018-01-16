class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  delegate :description, :name, :status, :picture, to: :course, prefix: true
  delegate :description, :name, :duration, :picture, to: :subject, prefix: true
end
