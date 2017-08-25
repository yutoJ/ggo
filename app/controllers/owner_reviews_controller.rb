class OwnerReviewsController < ApplicationController

  private
  def owner_review_params
    params.require(:owner_review).permit(:comment, :star, :reservation_id, :owner_id, :guest_id)
  end
end
