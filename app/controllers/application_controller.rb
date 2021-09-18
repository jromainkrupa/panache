class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  include Sortable

  before_action :set_locale
  before_action :authenticate_user!, unless: :skip_devise?
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  

  def set_locale
      I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :is_club_admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :is_club_admin, :avatar])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def skip_devise?
    params[:controller] =~ /(^pages$)/
  end
end
