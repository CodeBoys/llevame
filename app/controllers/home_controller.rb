class HomeController < ApplicationController

  def index
    @recents_dogs = Dog.recents
  end
end
