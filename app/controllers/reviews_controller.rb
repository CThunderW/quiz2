class ReviewsController < ApplicationController
    before_action :find_review, only: [:edit, :destroy, :update]
    before_action :authenticate_user!
    before_action :authorize_user!, except: [:create]

    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        if @review.save
            redirect_to idea_path(@idea)
        else
            @reviews = @idea.reviews.order(created_at: :asc)
            render "ideas/show"
        end
    end

    def edit
        render :edit
    end

    def show
        @reviews = @idea.reviews.order(created_at: :asc)
        @review = Review.new
    end

    def destroy
        @review.destroy
        redirect_to idea_path(@review.idea)
    end

    def update
        if @review.update review_params
            redirect_to idea_path(@review.idea)
        else
            render :edit
        end
    end

    private
    def find_review
        @review = Review.find params[:id]
    end

    def review_params
        params.require(:review).permit(:body)
    end

    def authorize_user!
        unless can? :crud, @review
            redirect_to root_path
        end
    end
end
