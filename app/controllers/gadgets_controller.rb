class GadgetsController < ApplicationController
  before_action :set_gadget, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
  end

  def update
  end

  def new
  end

  def create
  end

  private
  def is_conflict(start_date, end_date, room)
    check = gadget.reservations.where("( ? < start_date AND end_date < ? ) AND status = ?", start_date, end_date, 1)
    check.size > 0? true : false
  end

  def set_gadget
    @gadget = Gadget.find(params[:id])
  end
  def gadget_params
    params.require(:gadget).permit(:gadget_type, :listing_name, :city, :price, :active, :instant, :description)
  end
end
