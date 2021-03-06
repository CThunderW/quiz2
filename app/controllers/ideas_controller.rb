class IdeasController < ApplicationController
    before_action :find_idea, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, EXCEPT: [:show, :index]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new idea_params
        @idea.user = current_user
        if @idea.save
            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end

    def index 
        @ideas = Idea.order(created_at: :desc)
    end

    def show
        @reviews = @idea.reviews.order(created_at: :asc)
        # byebug
        @review = Review.new
    end

    def destroy
        @idea.destroy
        redirect_to root_path
    end

    def edit
    end

    def update
        if @idea.update idea_params
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end

    def find_idea
        @idea = Idea.find params[:id]
    end

    private
    def idea_params
        params.require(:idea).permit(:title, :body)
    end

    def authorize_user!
        unless can?(:crud, @idea)
            redirect_to root_path
        end
    end
end
