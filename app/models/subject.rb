class Subject < ApplicationRecord
  has_many :course_subjects, dependent: :nullify
  has_many :users, through: :course_subjects
  has_many :tasks, dependent: :nullify
end
