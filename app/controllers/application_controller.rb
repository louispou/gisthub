class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Permet d'ajouter la colonne nom lors du sign up
   before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    elsif params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    end
  end
end
