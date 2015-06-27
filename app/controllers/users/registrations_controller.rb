class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :facebook_image_url)
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar,
                                 :avatar_cache, :email,
                                 :password, :password_confirmation,
                                 :facebook_image_url)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
