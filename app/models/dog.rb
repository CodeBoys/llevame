class Dog < ActiveRecord::Base
  belongs_to :breed
  has_many :photos
  scope :recents, -> {Dog.last(15)}
end
