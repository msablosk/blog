module CommentsHelper
	def comments_params
  		params.require(:comment).permit(:author, :body)
	end
end
