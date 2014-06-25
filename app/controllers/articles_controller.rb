class ArticlesController < ApplicationController
	
	def index
		@articles = Article.all
	end

	def new
		if user_signed_in? 
			@article = Article.new
		else
			redirect_to new_user_session_path
		end
	end
	
	def edit
		if user_signed_in? 
			@article = Article.find(params[:id])
		else
			redirect_to new_user_session_path
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
	
	def create
		@article = Article.new(article_params)
	 
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def destroy
		if user_signed_in? 
			@article = Article.find(params[:id])
			@article.destroy
		
			redirect_to @article
		else
			redirect_to new_user_session_path
		end
	end
	 
	def show
		@article = Article.find(params[:id])
	end 
	 
	private
	  def article_params
		params.require(:article).permit(:title, :text)
	  end

end
