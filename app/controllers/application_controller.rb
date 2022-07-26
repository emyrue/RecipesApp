class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      root_path(resource)
    else
      super
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end
