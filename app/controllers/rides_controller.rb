require 'ride_share_util'

class RidesController < ApplicationController
  def index
    @all_NY_counties = Ride.all_NYcounties
  end
  #fixed new in rides, params were wrong
  def new
    @all_NY_counties = Ride.all_NYcounties
  end
  
  def ride_params
    params.require(:ride).permit(:departure_location, :destination_location, :date_and_time, :poster_user_id)
  end

  def create
    if logged_in?
      @name = current_user[:email]
      @name.slice!('@binghamton.edu')
    end
    @newRide = params[:ride]
    @newRide["poster_user_id"] = session[:user_id] #so we can record the user ID
    @valid = true
    @newRide.each do |key, value|
      if value == ""
        @valid = false
        @message = 'You need to select all the fields.'
      end
    end
    
    # All values are present, but we need to make sure the time and date
    # are in valid formats.
    if @valid
      result, msg = RideShareUtil.valid_date? params[:ride]['date']
      if result != :valid
        @valid = false
        @message = msg
      else
        result, msg = RideShareUtil.valid_time? params[:ride]['time']
        if  result != :valid
          @valid = false
          @message = msg
        end
      end
    end
    
    # The values are all valid, so generate the ride!
    if @valid
      @message = "Your ride has been posted."
      @departure = @newRide["departure_location"]
      @destination = @newRide["destination_location"]
      @posterUserId = @newRide["poster_user_id"]
      
      # The DateTime#parse method expects the date in European format (DD/MM/YYYY) and
      # we use American format (MM/DD/YYYY), so we need to convert.
      date_match = RideShareUtil.date_regex.match params[:ride]['date']
      euro_date_str = "#{date_match['day']}/#{date_match['month']}/#{date_match['year']}"
      @date_and_time = DateTime.parse("#{euro_date_str} #{params[:ride]['time']} #{Time.zone.formatted_offset}")
      params[:ride][:date_and_time] = @date_and_time
      
      Ride.create!(ride_params)
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  def search
    @valid = true
    @newSearch = params[:search]
    params[:search].each do |key, value|
      if value == ""
        @valid = false
        @message = 'You need to select all the fields!'
        break
      end
    end

    # If we're still valid that means all the fields are filled in, but
    # is the date field in the valid format?
    if @valid
      result, msg = RideShareUtil.valid_date? params[:search]['date']
      if result != :valid
        @valid = false
        @message = msg
      end
    end
      
    if @valid
      @rides = Ride.searchRides params[:search]
    else
      @rides = []
    end

  end  
end
