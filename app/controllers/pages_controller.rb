class PagesController < ApplicationController
  def home
    @sports = Sport.where(is_highlight: true).limit(4)
    @events = Event.next_from_now.limit(9)
  
  end
end
