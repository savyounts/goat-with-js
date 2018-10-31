class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes, :user_id, :destination_id
  belongs_to :destination
end
