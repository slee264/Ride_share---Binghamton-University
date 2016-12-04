class RidesController < ApplicationController
  def index
    @all_NY_counties = Ride.all_NYcounties
  end
  
  def new
    @all_NY_counties = Ride.all_NYcounties
  end
  
  def ride_params
    params.require(:ride).permit(:departure_location, :destination_location, :dateAndTime)
   end

  def create
    Ride.create!(ride_params)
    @newRide = params[:ride]
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  def search
    @ride = params[:search]
    @rides = Ride.searchRides @ride
  end
end
