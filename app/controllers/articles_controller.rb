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
  logger.debug params.inspect
  @article = Article.new(article_params)

  if @article.save 
      redirect_to @article #if saved browser redirected to articles page
  else
      logger.debug @article.errors.inspect 
      render :new, status: :unprocessable_entity #if article not saved form redisplayed and status code 422 displayed
  end
end

def edit
    @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
      redirect_to @article
  else
      render :edit, status: :unprocessable_entity
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to root_path, status: :see_other
end

private #filters params
def article_params
      params.require(:article).permit(:title, :body, :status)
end

end