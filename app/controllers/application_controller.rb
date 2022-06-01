class ApplicationController < ActionController::Base
  before_action :authenticate_any!, except: [:top, :about]
  # before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_any!
    if admin_signed_in?
        true
    else
        authenticate_customer!
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :customer
      root_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    customer_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number])
  end
end
