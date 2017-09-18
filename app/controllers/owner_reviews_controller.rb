class OwnerReviewsController < ApplicationController

  def create
    # Check if the reservation exist (gadget_id, quest_id, owner_id)

    # Check if the current owner aleady reviewd the guest in this reservation

    @reservation = Reservation.where(
    id: owner_review_params[:reservation_id],
    gadget_id: owner_review_params[:gadget_id],
    user_id: owner_review_params[:guest_id]
    ).first

    if !@reservation.nil?
      @has_reviewed = OwnerReview.where(
      reservation_id: @reservation.id,
      guest_id: owner_review_params[:guest_id]
      ).first

      if @has_reviewed.nil?
        # Allow to review
        @owner_review = current_user.owner_reviews.create(owner_review_params)
        flash[:success] = "レビューを投稿しました"
      else
        # Already reviewed
        flash[:success] = "すでにレビュー済みです"
      end
    else
      flash[:alert] = "予約が存在しませんでした"
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @owner_review = Review.find(params[:id])
    @owner_review.destroy
    redirect_back(fallback_location: request.referer, notice: "削除しました")
  end

  private
  def owner_review_params
    params.require(:owner_review).permit(:comment, :star, :gadget_id, :reservation_id, :guest_id)
  end
end
