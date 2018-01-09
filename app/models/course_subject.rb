class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  enum status: {init: 0, started: 1, stopped: 2}
  delegate :description, :name, :status, :picture, to: :course, prefix: true
  delegate :description, :name, :duration, :picture, to: :subject, prefix: true
  scope :with_subject, ->(subject){where(subject_id: subject.id)}
end
