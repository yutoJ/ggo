class PagesController < ApplicationController
  def home
    @gadget = Gadget.where(active: true).limit(6)
  end
end
