class Response < ApplicationRecord
  belongs_to :thread_list
  validates :comment, presence: true
  belongs_to :user
end
