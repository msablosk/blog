class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.last(3)
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)
		@article.save

		flash.notice = "Article was created!"

		redirect_to article_path(@article.id)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(articles_params)

		flash.notice = "Article was updated!"

		redirect_to article_path(@article.id)
		
	end

	def destroy 
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article was deleted!"

		redirect_to articles_path
	end

	
end
