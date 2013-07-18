module Api
  class ReadableItemsController < ApplicationController
    respond_to :json

    def index
      @readable_items = current_user.shared_items.map {|si| si.readable_items.first}
      respond_with @readable_items, root: false
    end

    def show
      shared_item = SharedItem.find(params[:id])
      @readable_item = shared_item.readable_items.last
      respond_with @readable_item, root: false
    end
  end
end