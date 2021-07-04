class Customers::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    def create
      if params[:type] == 'Customer' 
        params[:user] = params[:user]&.merge(type: 'Customer')
      else
        params[:user] = params[:user]&.merge(type: 'Seller')
      end
      super
    end
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[type name phone])
    end
  end