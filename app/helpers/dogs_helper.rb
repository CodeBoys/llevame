module DogsHelper
  def get_breeds
    Breed.all.order(:name)
  end

  def get_first_photo(dog)
    if dog.photos.count>0
      image_tag dog.photos.first.photo.url(:mini)
    else
      "No hay foto"
    end

  end
end
