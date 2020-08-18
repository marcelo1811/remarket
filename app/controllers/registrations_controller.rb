class RegistrationsController < Devise::RegistrationsController
  def new
    cookies[:invite_code] = params[:invite_code]
    super
  end
end 