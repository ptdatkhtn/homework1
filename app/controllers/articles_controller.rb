class ArticlesController < ApplicationController
  def index
    #keyword = params[:q]
  #  @articles = Article.find_by_title(keyword) || []
  sort_mode = params[:sort_mode]
  @articles = Article.search(params[:q])

  end

  def create
    @article = Article.new(article_params)
    unless(@article.save)
      flash[:error] = "Error : cannot create new article"
      render 'new'
    else
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new
  end
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    article = Article.find(params[:id])
    if(article.update(article_params).present?)
      redirect_to article_path(params[:id])
    else
      reder 'edit'
    end
    params.require(:article).permit(:title, :content)

  end
end
