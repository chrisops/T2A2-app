require 'uri'
require 'net/http'

class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def get_logged_in_user
        if user_signed_in?
            @user = current_user
        else
            @user = {
                name: "Guest",
                email: "no email"
            }
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :address, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :address)}
   end

end