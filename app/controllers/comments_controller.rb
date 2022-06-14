class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @article.comments.create(comment_params.to_h.merge!({ user_id: current_user.id }))
    redirect_to article_path(@article), notice: 'Comment created succefully'
  end

  def edit; end

  def update
    authorize @comment

    if @comment.update(comment_params)
      redirect_to @article, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment deleted succefully'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
