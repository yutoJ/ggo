class PagesController < ApplicationController
  def home
    @gadgets = Gadget.where(active: true).limit(6)
  end
end
