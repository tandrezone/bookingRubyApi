class BoookingsController < ApplicationController
  before_action :set_user
  before_action :set_user_booking, only: [:show, :update, :destroy]


  def index
    json_response(@user.bookings)
  end

  def show
    json_response(@booking)
  end

  # POST /todos/:todo_id/items
  def create
    @user.bookings.create!(bookings_params)
    json_response(@user, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @booking.update(booking_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def booking_params
    params.permit(:name, :done)
  end

  def set_todo
    @user = User.find(params[:user_id])
  end

  def set_user_booking
    @booking = @user.bookings.find_by!(id: params[:id]) if @user
  end
end
