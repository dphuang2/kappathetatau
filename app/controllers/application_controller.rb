class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Redirect to root if user tries to access page they don't have authorization to do so
  rescue_from Pundit::NotAuthorizedError do
    redirect_to '/', alert: "You do not have access to this page"
  end

  protected

  # The path used after sign in.
  def after_sign_in_path_for(resource)
    resumes_path # Redirect to resumes list after sign in
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
