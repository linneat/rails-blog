class CommentsController < ApplicationController
    def create
      article_id = params["article_id"]
      @article = Article.find(article_id)
      @comment = @article.comments.new
      @comment.commenter = params["comment"]["commenter"]
      @comment.body = params["comment"]["body"]
      @comment.save
      redirect_to article_path(@article)
    end
end
