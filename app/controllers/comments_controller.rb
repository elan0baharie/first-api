class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    json_response(@comments)
  end

  def show
    @comment = Comment.find(params[:id])
    json_response(@comment)
  end

  def create
    @comment = Comment.create!(comment_params)
    json_response(@comment, :created)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update!(comment_params)
      render status: 200, json: {
        message: "Your comment has successfully been updated."
        }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      render status: 200, json: {
        message: "Your comment has been successfully deleted."
      }
    end
  end

  private

  def comment_params
    params.permit(:commenter, :body, :quote_id)
  end

end
