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
          respond_to do |format|
            format.html { redirect_to @article }
            format.json { render json: @article }
          end
        else
          respond_to do |format|
            format.html { render 'new' }
            format.json { render body: nil, status: :bad_request }
          end
        end
    end

    def update
      article_id = params["id"]
      @article = Article.find(article_id)
      @article.title = params["article"]["title"]
      @article.text = params["article"]["text"]
   
      if @article.save
        respond_to do |format|
          format.html { redirect_to @article }
          format.json { render json: @article }
        end
      else
        respond_to do |format|
          format.html { render 'edit' }
          format.json { render body: nil, status: :bad_request }
        end        
      end
    end

      
    def destroy
        @article = Article.find(params["id"])
        @article.destroy
        respond_to do |format|
          format.html { redirect_to articles_path }
          format.json { render body: nil, status: :ok }
        end 
     end
end
