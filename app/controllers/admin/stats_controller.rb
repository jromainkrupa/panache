module Admin
  class StatsController < Admin::ApplicationController
    def index
      @stats = {
        event_count: Event.count,
        club_count: Club.count,
        sport_count: Sport.count,
        user_count: User.count
      }
    end
  end
end