class ArticlesController < ApplicationController
  include Paginable

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, except: %i[index new create]
  def index
    category = Category.find_by_name(params[:category]) if params[:category].present?
    @featured = Article.filtered_by_category(category)
                       .first(3)
    featured_ids = @featured.pluck(:id)
    @articles = Article.without_featured(featured_ids)
                       .filtered_by_category(category)
                       .page(current_page)

    @categories = Category.all
  end

  def show; end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: 'Article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
