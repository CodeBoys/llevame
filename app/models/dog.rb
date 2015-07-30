class Dog < ActiveRecord::Base
  belongs_to :breed
  scope :recents, -> {Dog.last(10)}
end
