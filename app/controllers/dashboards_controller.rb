class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gadget = current_user.gadgets
  end

end
