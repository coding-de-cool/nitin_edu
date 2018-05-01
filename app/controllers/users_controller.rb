class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new
    @user.build_address
    respond_to do |format|
      format.html
    end
  end

  # TODO - Modify below mthod after integration of Email confirmatin module
  # of devise
  def create
    @user = User.new(user_params)
    if @user.save
      set_flash_message :notice, :signed_up
      redirect_to new_user_session_path
    else
      set_flash_message :error, :not_able_to_signed_up
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :email, 
        :password, 
        :password_confirmation, 
        address_attributes: [
          :first_name, 
          :middle_name, 
          :last_name, 
          :city, 
          :state, 
          :pincode
        ]
      )
  end

end