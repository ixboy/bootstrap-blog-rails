module ArticlesHelper
  def date_helper(datetime)
    datetime.strftime('%B %e, %Y')
  end
end
