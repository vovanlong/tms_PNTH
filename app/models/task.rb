class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :subject
  scope :get_task, ->(id){where(subject_id: id)}
end
