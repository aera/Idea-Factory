require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let (:user) {FactoryGirl.create(:user)}

  def valid_idea
	   post :create, params: {idea: FactoryGirl.attributes_for(:idea)}
  end

  def invalid_idea
		post :create, params: {idea: FactoryGirl.attributes_for(:idea, title: '')}
  end


  describe "#new" do
	   context "user not signed in" do
	      it "redirects to the sign in page" do
		      get :new
		      expect(response).to(redirect_to(new_session_path))
	      end
	end

	context "user is signed in" do
	  before do
		   request.session[:user_id] = user.id
	  end

	  it "renders a new template" do
		  get :new
		  expect(response).to render_template(:new)
	  end

	  it "assigns a new idea instance" do
		  get :new
		  expect(assigns(:idea)).to(be_a_new(Idea))
	  end
	end
  end

  describe "#create" do
	  context "user is not signed in" do
	    it "redirects to the sign in page" do
		    get :new
		    expect(response).to redirect_to(new_session_path)
	    end
	end

	context "user is signed in" do
	  before do
		  request.session[:user_id] = user.id
	  end

	  context "with valid attributes" do
  		it "creates a new idea in the database" do
  		  count_before = Idea.count
  		  valid_idea
  		  count_after = Idea.count
  		  expect(count_after).to eq(count_before + 1)
  		end

		it "redirects to the show page" do
		  valid_idea
		  expect(response).to redirect_to(idea_path(Idea.last))
		end
	  end

	  context "with invalid attributes" do
		it "renders a new page" do
			invalid_idea
			expect(response).to render_template(:new)
		end
	  end
	end
  end

end
