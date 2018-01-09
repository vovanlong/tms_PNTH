class Course < ApplicationRecord
  has_many :user_courses, dependent: :nullify
  has_many :course_subjects, dependent: :nullify
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects
  has_many :having_sb, through: :course_subjects, source: :subject
  validates :name, presence: true
  validates :description, presence: true

  scope :created_desc, ->{order(created_at: :desc)}
  enum status: {init: 0, in_progress: 1, finish: 2}

  def add_sb subject, start_at
    deadline = start_at + subject.duration.days
    course_subjects.create(subject_id: subject.id, deadline: deadline)
  end

  def remove_sb subject
    having_sb.delete subject
  end
end
