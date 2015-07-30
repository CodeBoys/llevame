module DogsHelper
  def get_breeds
    Breed.all.order(:name)
  end
end
