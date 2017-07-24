class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :update, :edit, :destroy, :like]
  before_action :authenticate_user!, except: [:index, :show]

  def new
	@idea = Idea.new
  end

  def create
  	@idea = Idea.new(idea_params)
    @idea.user = current_user
  	if @idea.save
  	  flash[:notice] = "successfully created a new idea"
  	  redirect_to idea_path(@idea)
  	else
  	  flash[:alert] = "Please fix errors below"
  	  render :new
  	end
  end

  def index
    @idea = Idea.new
  	@ideas = Idea.order(like_count: :desc)
    @idea = Idea.new
  end

  def show
	@review = Review.new
	@reviews = @idea.reviews.order(created_at: :desc)
  end

  def edit
	head :unauthorized unless can? :edit, @idea
  end

  def update
	if !(can? :update, @idea)
	  head :unauthorized
	elsif @idea.update(idea_params)
	  redirect_to idea_path(@idea), notice: 'sucecssfully updated idea'
	else
	  flash[:alert] = 'Please fix the errors below'
	  render :edit
	end
  end

  def destroy
	if (can? :destroy, @idea)
		@idea.destroy
		redirect_to ideas_path, notice: "successfully deleted idea"
	else
	  head :unauthorized
	end
  end

  def like
	new_count = @idea.like_count.push(session[:user_id])
	@idea.update(like_count: new_count)
	redirect_to ideas_path, notice: 'liked' 
  end

  private

  def idea_params
	params.require(:idea).permit([:title, :description, :user])
  end

  def find_idea
	@idea = Idea.find(params[:id])
  end
end
