class ArticlesController < ApplicationController

  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
   before_action :authenticate_user! 
  def index
    @articles = current_user.articles.all
    @article = current_user.articles.build
    # render 'welcome/index'
  end

  def show
    @article = Article.find(params[:id])
    @comment= Comment.new

  end
 
  def new
    @article = current_user.articles.build
    @article.comments.build
  
  end	
	# def create
    
  #    @article = Article.new(params.require(:article).permit(:title, :text))

  #    @article = Article.new(params[:article])
     
  #    @article.save
  #    redirect_to @article


  #    #render plain: params[:article].inspect
  #    end
  def edit
   @article = Article.find(params[:id])
  end


  def create
    
   # @article = current_user.articles.build(article_params)
   # if @article.save
   # redirect_to @article
   # else
   #  render 'new'

    @article = current_user.articles.create(article_params)
    respond_to do |format|
       unless @article.errors.any? 
         @valid = true
         @articles = Article.all  
       else
         @valid = false
       end
      format.html { redirect_to @article, notice: 'Article was successfully created.' }
      format.js  {}
    end
  end
     
  def update
  @article = Article.find(params[:id])
     if @article.update(article_params)
     redirect_to @article
     else
     render 'edit'
    end
  end
  def destroy
    
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
    
    end
end

  private
  def article_params
    params
    .require(:article)
    .permit(:title, :text, :subtitle, :image ,comments_attributes: [:comment_id, :commenter ,:body, :_destroy])
  end

