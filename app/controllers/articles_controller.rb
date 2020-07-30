class ArticlesController < ApplicationController
    def index
        @articles = Article.all
       
        respond_to do |format|
          format.html
          format.json { render json: @articles }
        end
    end

    def show
      @article = Article.find(params["id"])

      respond_to do |format|
        format.html
        format.json { render json: @article }
      end
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params["id"])
    end

    def create
        @article = Article.new
        @article.title = params["article"]["title"]
        @article.text = params["article"]["text"]
 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
      article_id = params["id"]
      @article = Article.find(article_id)
      @article.title = params["article"]["title"]
      @article.text = params["article"]["text"]
   
      if @article.save
        redirect_to @article
      else
        render 'edit'
      end
    end

      
    def destroy
        @article = Article.find(params["id"])
        @article.destroy
        redirect_to articles_path
     end
end
