class GuestReviewsController < ApplicationController

  def create
    # Check if the reservation exist (gadget_id, quest_id, owner_id)

    # Check if the current owner aleady reviewd the guest in this reservation
    @reservation = Reservation.where(
      id: guest_review_params[:reservation_id],
      gadget_id: guest_review_params[:gadget_id]
    ).first

    if !@reservation.nil? && @reservation.gadget.user.id == guest_review_params[:owner_id].to_i
      @has_reviewed = GuestReview.where(
        reservation_id: @reservation.id,
        owner_id: guest_review_params[:owner_id]
      ).first

      if @has_reviewed.nil?
        # Allow to review
        @guest_review = current_user.guest_reviews.create(guest_review_params)
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
    @guest_review = Review.find(params[:id])
    @guest_review.destroy

    redirect_back(fallback_location: request.referer, notice: "削除しました")
  end

  private
  def guest_review_params
    params.require(:guest_review).permit(:comment, :star, :gadget_id, :reservation_id, :owner_id)
  end
end
