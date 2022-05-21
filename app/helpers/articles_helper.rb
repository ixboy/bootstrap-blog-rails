module ArticlesHelper
  def date_helper(datetime)
    datetime.strftime('%B %e, %Y')
  end

  def new_article_link
    return unless current_user

    link_to 'create new article',
            new_article_path,
            class: 'btn btn-success'
  end

  def edit_article_link(article)
    return unless policy(article).update?

    link_to 'Edit', edit_article_path(article),
            class: 'btn btn-primary'
  end

  def delete_article_link(article)
    return unless policy(article).destroy?

    link_to 'Destroy', article_path(article), data: {
      method: :delete,
      confirm: 'Are you sure?'
    }, class: 'btn btn-danger'
  end
end
