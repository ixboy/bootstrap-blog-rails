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

  def edit_comment_link(article, comment)
    return unless policy(comment).update?

    link_to 'Edit', edit_article_comment_path(article, comment),
            class: 'btn btn-primary'
  end

  def delete_comment_link(article, comment)
    return unless policy(comment).destroy?

    link_to 'Delete', article_comment_path(article, comment), data: {
      method: :delete,
      confirm: 'Are you sure?'
    }, class: 'btn btn-danger'
  end
end
