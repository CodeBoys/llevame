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

  def is_user_logged
    if user_signed_in?
      link_to "Poner en adopcion", new_user_dog_path(current_user.id), class: "btn btn-success big_button btn_white_font"
    else
      link_to "Poner en adopcion", new_user_registration_path, class: "btn btn-success big_button btn_white_font"
    end
  end
end
