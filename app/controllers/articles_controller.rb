class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        # @ is an instance variable
        # A ruby instance variable is available to all methods in the instance
        @articles = Article.all
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
        # @article = Article.new
        # @article.title = params[:article][:title]
        # @article.body = params[:article][:body]

        # @article = Article.new(
        #     title: params[:article][:title],
        #     body: params[:article][:body]
        # )

        @article = Article.new(article_params)
        @article.save
        flash.notice = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article '#{@article.title}' Deleted..."
        redirect_to articles_path
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end
end
