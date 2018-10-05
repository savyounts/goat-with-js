class CommentsController < ApplicationController
  before_action :require_login

  def new
    @destination = Destination.find_by(id: params[:destination_id])
    @comment = @destination.comments.build(user_id: current_user.id)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to destination_path(@comment.destination)
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @destination = @comment.destination
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment_params)
    redirect_to destination_path(@comment.destination)
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :destination_id, :content)
    end
end
