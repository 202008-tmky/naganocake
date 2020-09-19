class ApplicationController < ActionController::Base
# 新規登録時
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:
      	[:first_name, :last_name, :first_name_kana, :last_name_kana,
         :email, :postal_code, :address, :telephone_number])

    end
end
