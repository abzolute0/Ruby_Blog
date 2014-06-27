class CommentsController < ApplicationController
	
	def create
		if user_signed_in? 
			@article = Article.find(params[:article_id])
			@comment = @article.comments.create(comment_params)
			@comment.user_id = current_user.id
			
			if (@article.user_id == current_user.id)
				@comment.approved = 1
				@comment.save
				flash[:notice] = "Comment created"
				redirect_to article_path(@article)
			else
				@comment.approved = 0
				@comment.save
				flash[:notice] = "Comment created"
				redirect_to article_path(@article)
			end
		else
			redirect_to new_user_session_path, 
			alert: "You're not signed in, Please sign in first to comment a Article"
		end
	end
	
	def destroy
		if user_signed_in? 
			@article = Article.find(params[:article_id])
			@comment = @article.comments.find(params[:id])
			@comment.approved = 0;
			@comment.destroy
			
			redirect_to article_path(@article),
			alert: "Comment deleted"
		else
			redirect_to new_user_session_path
		end
	end	
	
	def update
		if user_signed_in?
			@article = Article.find(params[:article_id])
			@comment = @article.comments.find(params[:id])
			
			if (@article.user_id = current_user.id)
				@comment.approved = 1
				@comment.save
				redirect_to article_path(@article)
				flash[:notice] = "Comment approved"
			else
				redirect_to article_path(@article),
				alert: "This is not you comment	"
			end	
		else
			redirect_to new_user_session_path
		end
	end
	
	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
