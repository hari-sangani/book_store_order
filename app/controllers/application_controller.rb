class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name contact_no address username])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
