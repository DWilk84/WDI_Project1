class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user


  def calendar_inputs
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    # binding.pry
    if @classroom

      @event_strips = @classroom.bookings.event_strips_for_month(@shown_month)
    else
      @event_strips = Booking.event_strips_for_month(@shown_month)
    end
  end

  private
  def current_user
    begin
      
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end
end