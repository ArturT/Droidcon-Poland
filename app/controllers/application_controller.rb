class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    if I18n.available_locales.include?(params[:locale].to_sym)
      I18n.locale = params[:locale]
    else
      # remove unnecessary fake locale param from url
      redirect_to root_path unless params[:locale].blank?

      I18n.locale = I18n.default_locale
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end
end
