class Dog < ActiveRecord::Base
  validates :owner_email, confirmation: {message: "La confirmación de correo no coincide"}
  validates :name, :age,
    :description, :particular_signals, :owner_name,
    :owner_email, :owner_email, :owner_phone, :password,
    :breed_id, :anonymous, presence: {message: "Campo requerido"}
  validates :age, :owner_name, :owner_email, :owner_phone, length: {
    maximum: 50, minimum: 5, message: "El valor debe estar entre 5 y 50 letras"
  }
  validates :name, length: {minimum: 2, maximum: 15, message: "El valor debe estar entre 2 y 15 letras"}
  validates :password, length: {minimum: 8, maximum: 16, message: "El valor debe estar entre 8 y 16 letras" }
  validates :particular_signals, length: {minimum: 5, maximum: 60, message: "El valor debe estar entre 5 y 60 letras"}
  validates :description, length: {minimum: 5, maximum: 200, message: "El valor debe estar entre 5 y 200 letras"}
  belongs_to :breed
  has_many :photos
  scope :recents, -> {Dog.last(15)}
end
