class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "user", password: "password", except: [:index, :show]
	before_action :get_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.all
  end

  def show
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to action: 'index'
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @article.update_attributes(article_params)
  		redirect_to action: 'index'
  	else
  		render 'edit'
    end
  end

  def destroy
  	@article.destroy
  	redirect_to action: 'index'
  end

  private
  def article_params
  	params.require(:article).permit(:title, :description)
  end

  def get_article
  	@article = Article.find(params[:id])
 	end
end
