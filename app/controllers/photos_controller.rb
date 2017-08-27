class PhotosController < ApplicationController
  def create
    @gadget = Gadget.find(params[:gadget_id])

    if params[:images]
      params[:images].each do |img|
        @gadget.photos.create(image: img)
      end
    end
    @photos = @gadget.photos
    redirect_back(fallback_location: request.referer, notice: "保存しました")
  end

  def destroy
    @photo = Photo.find(params[:id])
    @gadget = @photo.gadget
    @photo.destroy
    @photos = Photo.where(gadget_id: @gadget.id)

    respond_to :js
  end

end
