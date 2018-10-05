class Comment < ApplicationRecord
  belongs_to :destination
  belongs_to :user

  validates :destination_id, :user_id, :content, presence: true
end
