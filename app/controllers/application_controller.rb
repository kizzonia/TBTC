class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:email, :password, :referral_id, :password_confirmation, :current_password, :name, :lastname, :country, :address
      ])
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :password, :referral_id, :password_confirmation, :current_password, :name, :lastname, :country, :address
        ])
      end

end





private
def layout_by_resource
  if devise_controller? && resource_name == :managment && action_name == 'new'
    "devise"
elsif devise_controller? && resource_name == :managment && action_name == 'edit'
  'managment'
else
  "application"
end
end
