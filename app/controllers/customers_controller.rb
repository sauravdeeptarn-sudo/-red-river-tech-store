class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def profile
    @customer = current_customer
    @provinces = Province.all.order(:name)
  end

  def update_profile
    @customer = current_customer
    @provinces = Province.all.order(:name)

    if @customer.update(address: params[:address], province_id: params[:province_id])
      flash[:notice] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash[:alert] = "Error updating profile!"
      render :profile
    end
  end
end