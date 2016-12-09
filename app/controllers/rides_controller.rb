class RidesController < ApplicationController
  def index
    @all_NY_counties = Ride.all_NYcounties
  end
  #fixed new in rides, params were wrong
  def new
    @all_NY_counties = Ride.all_NYcounties
  end
  
  def ride_params
    params.require(:ride).permit(:departure_location, :destination_location, :dateAndTime)
  end

  def create
    @newRide = params[:ride]
    @valid = true
    @newRide.each do |key, value|
      if value == ""
        @valid = false
      end
    end
    if @valid
      @departure = @newRide["departure_location"]
      @destination = @newRide["destination_location"]
      @year = @newRide["dateAndTime(1i)"]
      @month = Date::MONTHNAMES[(@newRide["dateAndTime(2i)"]).to_i]
      @date = @newRide["dateAndTime(3i)"]
      @hour = @newRide["dateAndTime(4i)"]
      @minute = @newRide["dateAndTime(5i)"]
      @newRide.inspect
    else
      @message = 'You need to select all the fields.'
    end
    Ride.create!(ride_params)
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  def search
    #@ride = params[:search]
    #@rides = Ride.searchRides @ride
    @rides = Ride.searchRides(params[:search])
  end
end
