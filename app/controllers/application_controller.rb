class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :type])
    end
    def after_sign_in_path_for(resource)
        if resource.type.eql?('Seller')
            sellers_url
        else 
            products_url
        end
    end
end
  