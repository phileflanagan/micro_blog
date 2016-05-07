class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    find_article
  end

  def create
    find_article
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    find_article
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end 
  end
  
  def show 
    find_article
  end
  
  def destroy
    find_article
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path 
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def find_article
    @article = Article.find(params[:id])
  end
  
end