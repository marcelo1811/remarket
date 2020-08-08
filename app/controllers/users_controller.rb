class UsersController < ApplicationController
  def index
    if current_user.admin?
      redirect_to [:admin]
    end

    @stores = current_user.stores    
  end
end
