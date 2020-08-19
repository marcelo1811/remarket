module Admin
  class StoresController < AdminController
    skip_before_action :set_store, only: [:new, :create]

    def new
      @store = Store.new
    end

    def create
      @store = Store.new(store_params.merge(user: current_user))

      if @store.valid?
        @store.save!
        redirect_to admin_path
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @store.update(store_params)
        redirect_to [:admin]
      else
        render 'edit'
      end
    end

    def resellers
      catalogue_ids = @store.catalogue_stores.pluck(:catalogue_id)
      @reseller_catalogues = Catalogue.where(id: catalogue_ids)
    end

    private

    def store_params
      params.require(:store).permit(:name, :description, :terms, :whatsapp_number, :whatsapp_ddd)
    end
  end
end