class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:approve, :decline]

  def create
    gadget = Gadget.find(params[:gadget_id])

    if current_user == gadget.user
      flash[:alert] = "これはあなたのガジェットです"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.gadget = gadget

      @reservation.price = gadget.price * days

      if @reservation.save
        if gadget.Request?
          flash[:notice] = "予約リクエストを送りました"
        else
          @reservation.Approved!
          flash[:notice] = "予約が完了しました"
        end
      else
        flash[:alert] = "申し訳ございません、予約ができませんでした"
      end

    end
    redirect_to gadget
  end

  def your_rents
    @rents = current_user.reservations.order(start_date: :asc)
  end

  def your_reservations
    @gadgets = current_user.gadgets
  end

  def approve
      @reservation.Approved!
      #ReservationMailer.send_email_to_guest(@reservation.user).deliver if reservation.user.setting.enable_email
      redirect_to your_reservations_path
  end

  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end

  private
  def set_reservation
    @reservation =Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
