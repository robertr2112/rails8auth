# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  # resume_session only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save
      # @user.send_activation_email
      start_new_session_for @user
      # flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      @user.password = ""
      @user.password_confirmation = ""
      # render "new"
      render :new, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email_address, :password,
                                   :password_confirmation)
    end
end
