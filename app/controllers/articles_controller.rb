class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.last(3)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)
		@article.save
		redirect_to article_path(@article.id)
	end

	def destroy 
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
end
