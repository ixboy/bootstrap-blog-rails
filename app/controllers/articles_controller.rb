class ArticlesController < ApplicationController
  include Paginable

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, except: %i[index show new create]

  def index
    @categories = Category.all
    category = @categories.select { |c| c.name == params[:category] } if params[:category].present?
    category = category[0] if category
    @featured = Article.includes(:category, :user)
                       .filtered_by_category(category)
                       .filtered_by_archive(params[:month_year])
                       .first(3)
    featured_ids = @featured.pluck(:id)
    @articles = Article.includes(:category, :user)
                       .without_featured(featured_ids)
                       .filtered_by_category(category)
                       .filtered_by_archive(params[:month_year])
                       .page(current_page)
    @archives = Article.group_by_month(:created_at, format: '%B %Y').count
  end

  def show
    @article = Article.includes(comments: :user).find(params[:id])
    authorize @article
  end

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
