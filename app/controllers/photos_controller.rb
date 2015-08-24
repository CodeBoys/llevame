class PhotosController < ApplicationController
  before_action :set_dog, only: [:new, :create]
  def new
    @photo = @dog.photos.new
  end

  def create
    if params[:photos]
      params[:photos].first.each do |photo|
        @dog.photos.create(photo: photo[1])
      end
    end
    redirect_to user_dog_path(@user, @dog)
  end

  private
  def set_dog
    @user = current_user
    @dog = @user.dogs.find(params[:dog_id])
  end

  def photos_params
    params.require(:dog).permit(:photos[])
  end

end
