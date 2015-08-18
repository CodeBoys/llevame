class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy, :select_location]

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)
    respond_to do |format|
      if @dog.save
        if params[:photos]
          params[:photos].first.each do |photo|
            @dog.photos.create(photo: photo[1])
          end
        end
        format.html { redirect_to action: "select_location", id: @dog.id }
        format.js { render js: "window.location.href=buscar_ubicacion?id='"+@dog.id+"'"  }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_location
  end

  def set_location

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :age, :description, :particular_signals, :owner_name, :owner_email, :owner_phone, :lat, :lng, :breed_id, :anonymous, :password)
    end
end
