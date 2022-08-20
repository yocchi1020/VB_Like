class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

    def after_sign_out_path_for(resource_or_scope)
        return new_admin_session_path if resource_or_scope == :admin
        return root_path if resource_or_scope == :member
    end

    #サインイン後の遷移先を指定する
    def after_sign_in_path_for(resource)
        case resource
        when Admin
         admin_homes_top_path
        when Member
         root_path
        end
    end
  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :telephone_number])
    end
end
