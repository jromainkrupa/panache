class PagesController < ApplicationController
  def home
    @sports = Sport.where(is_highlight: true).limit(4)
    @events = Event.limit(10)
  end
end
