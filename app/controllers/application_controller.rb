class ApplicationController < ActionController::Base
  # before_action :load_user_abilities
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def load_user_abilities
    @load_user_abilities ||= Ability.new(current_user)
  end
end
