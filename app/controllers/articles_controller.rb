class ArticlesController < ApplicationController
  before_action :set_article, except: %i[index new create]
  def index
    current_page = (params[:page] || 1).to_i
    @featured = Article.first(3)
    featured_ids = @featured.pluck(:id)
    @articles = Article.without_featured(featured_ids)
                       .page(current_page)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit; end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
