class PhotosController < ApplicationController
  before_action :set_dog, only: [:new, :create]
  def new
    @photo = @dog.photos.new
  end

  def create

  end

  private
  def set_dog
    @user = current_user
    @dog = @user.dogs.find(params[:dog_id])
  end

end
