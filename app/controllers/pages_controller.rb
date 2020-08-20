class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :invite_reseller ]

  def home
  end

  def invite_reseller
    if current_user.try(:catalogue).present? && params[:invite_code]
        store = Store.find_by(id: params[:invite_code])
        return redirect_to store_terms_path(store) if store.present?

        redirect_to :users
    else
      redirect_to new_user_registration_path + "?invite_code=#{params[:invite_code]}"
    end
  end
end
