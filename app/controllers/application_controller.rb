class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_action
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_update

  def store_action
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end
  
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  
  def default_url_options
    { locale: I18n.locale }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :nick_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :nick_name, :email, :password, :current_password)}
  end

  private
  # 登出回到登入頁並且保留語言
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path(:locales => params[:locales])
  end

  def invalid_update
    redirect_to edit_group_path(id: params[:id])
    flash[:notice] = I18n.t("errors.messages.cant_delete_item")
  end
end
