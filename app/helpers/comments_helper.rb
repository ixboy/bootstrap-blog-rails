module CommentsHelper
  def comments
    if @article.comments.empty?
      html = ''.html_safe
      html.safe_concat '<p>No comments yet</p>'
      html
    else
      render @article.comments
    end
  end

  def add_comment
    if current_user
      render 'comments/form'
    else
      html = ''.html_safe
      html.safe_concat '<p>Sign in to add a comment</p>'
      html
    end
  end
end
