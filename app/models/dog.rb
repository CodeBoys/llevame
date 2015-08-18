class Dog < ActiveRecord::Base
  belongs_to :user
  validates :name, :age,
    :description, :particular_signals, :breed_id, presence: {message: "Campo requerido"}
  validates :age, length: {
    maximum: 50, minimum: 5, message: "El valor debe estar entre 5 y 50 letras"
  }
  validates :name, length: {minimum: 2, maximum: 15, message: "El valor debe estar entre 2 y 15 letras"}
  validates :particular_signals, length: {minimum: 5, maximum: 60, message: "El valor debe estar entre 5 y 60 letras"}
  validates :description, length: {minimum: 5, maximum: 200, message: "El valor debe estar entre 5 y 200 letras"}
  belongs_to :breed
  has_many :photos
  scope :recents, -> {Dog.last(15)}
end
