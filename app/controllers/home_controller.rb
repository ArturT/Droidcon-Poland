class HomeController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
    @grouped_schedules = Schedule.grouped_schedules
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

  def registration_tips
  end
end
