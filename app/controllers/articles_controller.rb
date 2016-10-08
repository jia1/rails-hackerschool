class ArticlesController < ApplicationController
	before_action :get_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
  	params.require(:article).permit(:title, :description)
  end

  def get_article
  	@article = Article.find(params[:id])
 	end
end
