module ArticlesHelper
  def date_helper(datetime)
    datetime.strftime('%B %e, %Y')
  end

  def new_article_link
    if current_user
      link_to 'create new article',
              new_article_path,
              class: 'btn btn-primary'
    end
  end
end
