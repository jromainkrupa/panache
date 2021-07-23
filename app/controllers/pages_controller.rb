class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @sports = Sport.limit(10)
    @events = Event.limit(10)
  end
end
