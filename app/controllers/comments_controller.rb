class CommentsController < ApplicationController
    include ArticlesHelper

    def index
        @comment = Comment.all
    end
    def show
        @comment = Comment.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    def new
        @comment = Comment.new 
    end
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
      
        @comment.save
      
        redirect_to article_path(@comment.article)
      end
      
      def comment_params
        params.require(:comment).permit(:author_name, :body)
      end
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        flash.notice = "Comment '#{@comment.title}' Destroyed!"

        redirect_to articles_path(@article)
    end
    def edit
        @comment = Comment.find(params[:id])
    end
    def update
        @comment = Comment.find(params[:id])
        @comment.update(article_params)

        flash.notice = "Comment '#{@comment.title}' Updated!"

        redirect_to article_path(@article)
    end
end
