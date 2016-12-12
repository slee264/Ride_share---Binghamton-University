class RidesController < ApplicationController
  def index
    @all_NY_counties = Ride.all_NYcounties
  end
  #fixed new in rides, params were wrong
  def new
    @all_NY_counties = Ride.all_NYcounties
  end
  
  def ride_params
    params.require(:ride).permit(:departure_location, :destination_location, :dateAndTime, :poster_user_id)
  end

  def create
    @newRide = params[:ride]
    @newRide["poster_user_id"] = session[:user_id] #so we can record the user ID
    @valid = true
    @newRide.each do |key, value|
      if value == ""
        @valid = false
      end
    end
    if @valid
      @message = "Your ride has been posted."
      @departure = @newRide["departure_location"]
      @destination = @newRide["destination_location"]
      @year = @newRide["dateAndTime(1i)"]
      @month = Date::MONTHNAMES[(@newRide["dateAndTime(2i)"]).to_i]
      @date = @newRide["dateAndTime(3i)"]
      @hour = @newRide["dateAndTime(4i)"]
      @minute = @newRide["dateAndTime(5i)"]
      @posterUserId = @newRide["poster_user_id"]
      Ride.create!(ride_params)
    elsif (@valid == false)
      @message = 'You need to select all the fields.'
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
    params[:search].each do |key, value|
      if value == ""
        @valid = false
        break
      end
    end
    if !@valid
      @message = 'You need to select all the fields!'
    end
    
    if @valid
      @rides = Ride.searchRides params[:search]
    else
      @rides = []
    end

  end  
end
