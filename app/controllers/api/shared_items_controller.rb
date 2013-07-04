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
  end
end