class GadgetsController < ApplicationController
  before_action :set_gadget, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @gadgets = current_user.gadgets
  end

  def show
  end

  def create
    @gadget = current_user.gadgets.build(gadget_params)
    if @gadget.save
      redirect_to listing_gadget_path(@gadget), notice: "保存しました"
    else
      flash[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def update
    updated_params = is_ready_room ? gadget_params : gadget_params.merge(active: true)
    if @gadget.update(updated_params)
      flash[:notice] = "保存しました"
    else
      flash[:alert] = "登録に失敗しました"
    end
    redirect_back(fallback_location: request.referer)
  end

  def new
    @gadget = current_user.gadgets.build
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def features
  end

  def requirements
  end

  def photo_upload
    @photos = @gadget.photos
  end

  def location
  end

  def preload
  today = Date.today
  reservations = @gadget.reservations.where("( start_date >= ? OR end_date >= ? ) AND status = ?", today, today, 1)
  render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date, @gadget)
    }
    render json: output
  end

  private
  def is_conflict(start_date, end_date, gadget)
    check = gadget.reservations.where("( ? < start_date AND end_date < ? ) AND status = ?", start_date, end_date, 1)
    check.size > 0? true : false
  end

  def set_gadget
    @gadget = Gadget.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "権限がありません。ログイン後、再度アクセスしてください" unless current_user.id == @gadget.user_id
  end

  def gadget_params
    params.require(:gadget).permit(:gadget_type, :listing_name, :address, :price, :active, :instant, :description, :has_guarantee, :has_manual, :has_content, :has_no_setup, :has_battery, :require_mobile, :require_account)
  end

  def is_ready_room
    !@gadget.active && !@gadget.price.blank? && !@gadget.listing_name.blank? && !@gadget.photos.blank? && !@gadget.address.blank?
  end
end
