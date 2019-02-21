class RegistrationsController < Devise::RegistrationsController


  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name)
  end
end
