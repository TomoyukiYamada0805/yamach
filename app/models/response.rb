class Response < ApplicationRecord
  belongs_to :thread_list
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 200 }
end
