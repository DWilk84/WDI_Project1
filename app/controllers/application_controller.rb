class ApplicationController < ActionController::Base
  protect_from_forgery

  def calendar_inputs
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    if @room
      @event_strips = @room.bookings.event_strips_for_month(@shown_month)
    else
      @event_strips = Booking.event_strips_for_month(@shown_month)
    end
  end
end