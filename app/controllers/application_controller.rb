class ApplicationController < ActionController::Base
# 新規登録時
before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:
      	[:first_name, :last_name, :first_name_kana, :last_name_kana,
         :email, :postal_code, :address, :telephone_number])

    end
end
