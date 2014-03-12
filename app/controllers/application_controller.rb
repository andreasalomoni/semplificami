class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :check_signed_in, unless: :devise_controller?

  def current_customer
    params[:customer_id]
  end

  def render_modal( titolo, partial, after = nil)
      tpl = "#{params[:controller]}/#{params[:action]}"
      render :partial => 'layouts/show', locals: {:titolo => titolo, :corpo =>  partial, after: template_exists?(tpl) ? tpl : nil }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :name]
  end

  def check_signed_in
    if !user_signed_in?
      redirect_to :new_user_session , alert: 'Accesso negato. Autenticarsi al sistema per proseguire.'
    end
  end
end

