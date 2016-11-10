class Creator::ReviewsController < CreatorController
  before_action :set_user
  before_action :set_review, only: [:update]

  def edit
  end

  def update
    @review.update(review_params)
  end

  private

  def set_review
    @review = @user.reviews.find(params[:id])
  end



  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
