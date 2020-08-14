class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?


# ログイン後
def after_sign_in_path_for(resource)
	case resource
	  when Admin
	  admin_root_path
	  when Customer
	  items_path
	end
end

# ログアウト後
def after_sign_out_path_for(resource)
	  home_top_path
end


protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_phonetic, :first_name_phonetic, :postal_code, :address, :phone_number, :is_deleted])
	end

end
