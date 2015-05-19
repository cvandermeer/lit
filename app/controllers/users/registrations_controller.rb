class Users::RegistrationsController < Devise::RegistrationsController

  private

  def account_update_params
    params.require(:user).permit(:name, :avatar, :student_number, :mobile, :email, :password, :password_confirmation, :current_password)
  end

end
