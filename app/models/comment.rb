class Comment < ApplicationRecord
  belongs_to :destination
  belongs_to :user

  validates :destination_id, :user_id, :content, presence: true

  def like
    self.likes += 1
    save
  end

  def dislike
    self.likes -= 1
    save
  end

end
