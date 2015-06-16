class ArticlesController < ApplicationController
  def new
    if logged_in?
    	@article = Article.new
    else
      flash[:alert] = "Must be logged in to create new articles"
    end
  end

  def create
  	@article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
  	@article = Article.find(params[:id])
  end

  def index
  	@articles = Article.all
  end

  def edit
    if logged_in?
      @article = Article.find(params[:id])
    else
      flash[:alert] = "Must be logged in to edit articles"
      redirect_to login_path
    end
  end

  def update
    	@article = Article.find(params[:id])
    	if @article.update_attributes(article_params)
        flash[:success] = "#{@article.title} updated"
        redirect_to article_path(@article)
      else
        flash.now[:danger] = "Invalid information"
        render :edit
      end
  end

  def destroy
  	@article = Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
