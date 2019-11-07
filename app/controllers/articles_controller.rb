
class ArticlesController < ApplicationController 
    before_action :set_article, only: [:edit, :updaet, :show, :destroy]

    def index 
        @article = Article.all
    end 

    def new 
        @article = Article.new
    end 

    def create
        @article = Article.new(article_params)
        if @article.save 
            flash[:success] = "Article was Successfully Created!"
            redirect_to article_path(@article)
        else 
            render 'new'
        end 
    end 

    def show 
    end 

    def edit 

    end 

    def update
        @article = Article.find(params[:id])
        @article.update(title: params[:article][:title], description: params[:article][:description])
        flash[:success] = "Article updated successfully"
        redirect_to article_path(@article)
            # if @article.update(article_params)
            #     flash[:success] = "Article was successfully updated!"
            #     redirect_to article_path(@article)
            # else  
            #     render 'edit'
            # end
    end 

    def destroy

        @article.destroy
        flash[:success] = "Article was succesfully deleted"
        redirect_to article_path
    end 

    private 
        def set_article
            @article = Article.find(params[:id])
        end 

        def article_params
            params.require(:article).permit(:title, :description, :updated_at)
        end  


end 