class Course < ApplicationRecord
  has_many :user_courses, dependent: :nullify
  has_many :course_subjects, dependent: :nullify
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects
  validates :name, presence: true
  validates :description, presence: true
  scope :created_desc, ->{order(created_at: :desc)}
end
