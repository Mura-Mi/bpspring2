class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  alias_method :devise_current_user, :current_user

  def current_user
    return unless devise_current_user
    User.find_by_id(devise_current_user.id)
  end

  def not_found
    render 'errors/not_found', status: :not_found
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
