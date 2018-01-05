class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  enum status: {doing: 0, done: 1}
end
