module Api
  class SharedItemsController < ApplicationController
    respond_to :json

    def index
      @shared_items = current_user.shared_items.all
      respond_with @shared_items, root: false
    end

    def show
      @shared_item = current_user.shared_items.find(params[:id])
      respond_with @shared_item, root: false
    end

    def update
      @shared_item = current_user.shared_items.find(params[:id])
      if @shared_item.update!(shared_item_params)
        respond_with @shared_item, root: false
      end
    end

    private
    def shared_item_params
      params.require(:shared_item).permit(:read_state)
    end
  end
end