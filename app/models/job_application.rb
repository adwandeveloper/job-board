class JobApplication < ApplicationRecord
  validates :user_id, presence: true
  validates :job_id, presence: true
end