class GuestReviewsController < ApplicationController


  private
  def guest_review_params
    params.require(:host_review).permit(:comment, :star, :reservation_id, :owner_id, :guest_id)
  end
end
