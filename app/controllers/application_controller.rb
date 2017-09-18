class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_notifications, if: :signed_in?

  PERMISSIBLE_ATTRIBUTES = [:name, :nickname, :address, :introduction, :phone_number]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end

  private
  def current_notifications
    @notifications_count = Notification.where(user_id: current_user.id).where(read: false).count
  end
end
