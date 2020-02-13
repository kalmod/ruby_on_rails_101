class ArticlesController < ApplicationController
    def index
        # @ is an instance variable
        # A ruby instance variable is available to all methods in the instance
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
end
