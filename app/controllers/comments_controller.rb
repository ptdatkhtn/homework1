class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.article_id = params[:article_id]
    if(comment.save)
      redirect_to article_path(params[:article_id])
    else
      flash[:error] = "Error : cannot create new article"
      redirect_to article_path(params[:article_id])
    end
  end
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
