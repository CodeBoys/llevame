class HomeController < ApplicationController

  def index
    @recent_dogs = Dog.recents
  end
end
