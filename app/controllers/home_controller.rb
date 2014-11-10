class HomeController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
    @schedules = Schedule.with_time.start_time_asc
    @schedule_last_updated = Schedule.last_updated
    @sponsors = {
      diamond: Brand.diamond,
      gold: Brand.gold,
      silver: Brand.silver,
      bronze: Brand.bronze
    }
    @brands = {
      supporter: Brand.supporter,
      partner: Brand.partner,
    }
  end
end
