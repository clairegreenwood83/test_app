class ArticlesController < ApplicationController

def index
  @articles = Article.all
end

def show
  @article = Article.find(params[:id])
end

def new
  @article = Article.new
end

def create
  @article = Article.new(article_params)

  if @article.save 
      redirect_to @article #if saved browser redirected to articles page
  else
      render :new, status: :unprocessable_entity #if article not saved form redisplayed and status code 422 displayed
  end
end

private #filters params
  def article_params
      params.require(:article).permit(:title, :body)
  end
end