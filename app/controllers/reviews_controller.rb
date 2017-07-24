class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:destroy, :flag]

   def create
  	 @idea = Idea.find(params[:idea_id])
  	 #review_params = params.require(:review).permit(:body)
  	 @review = Review.new(review_params)
  	 @review.idea = @idea
	 @review.user = User.find(session[:user_id])
  	 if @review.save
  		redirect_to idea_path(@idea), notice: 'Review created'
  	 else
  		render 'ideas/show'
  	 end
   end

   def destroy
		#@review = review.find(params[:id])
		@idea = @review.idea
		@review.destroy
		redirect_to idea_path(@idea), notice: 'Review Deleted'
   end

   def flag 
	 @idea = Idea.find(params[:idea_id])
	 @review.update(flag: true)
	 redirect_to idea_path(@idea), notice: 'flagged review'
   end


   private

   def find_review
	    @review = Review.find(params[:id])
   end

   def review_params
	    params.require(:review).permit(:body)
   end

end
