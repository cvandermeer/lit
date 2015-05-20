class Users::RegistrationsController < Devise::RegistrationsController
 	before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name)
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation, :current_password)
  end

end
