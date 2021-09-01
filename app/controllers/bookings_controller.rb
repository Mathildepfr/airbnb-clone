class BookingsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @hat = Hat.find(params[:hat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @hat = Hat.find(params[:hat_id])
    @booking.hat = @hat
    @booking.rat = current_rat
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:accepted, :start_date, :end_date, :hat_id)
  end
end
