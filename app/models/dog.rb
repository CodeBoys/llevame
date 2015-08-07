class Dog < ActiveRecord::Base
  validates :owner_email, confirmation: true
  validates :name, :age,
    :description, :particular_signals, :owner_name,
    :owner_email, :owner_email, :owner_phone, :password,
    :breed_id, :anonymous, presence: {message: "Campo requerido"}
  validates :age, :owner_name, :owner_email, :owner_phone, length: {
    maximum: 50, minimum: 5
  }
  validates :name, length: {minimum: 2, maximum: 15, message: "el valor debe estar entre 2 y 15"}
  validates :password, length: {minimum: 8, maximum: 16}
  validates :particular_signals, length: {minimum: 5, maximum: 60}
  validates :description, length: {minimum: 5, maximum: 200}
  belongs_to :breed
  has_many :photos
  scope :recents, -> {Dog.last(15)}
end
