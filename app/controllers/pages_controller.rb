class PagesController < ApplicationController
  def home
    @sports = Sport.limit(10)
    @events = Event.limit(10)
  end
end
