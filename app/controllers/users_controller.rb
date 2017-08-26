class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @gadgets =@user.gadgets

    # Display all the guest reviews to host (if this user is a host)
    @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)

    # Display all the guest reviews to host (if this user is a host)
    @owner_reviews = Review.where(type: "OwnerReview", guest_id: @user.id)
  end

  def index
  end
end
