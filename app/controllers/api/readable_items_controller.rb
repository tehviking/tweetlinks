module Api
  class ReadableItemsController < ApplicationController
    respond_to :json

    def show
      shared_item = SharedItem.find(params[:id])
      @readable_item = ReadableItem.new(shared_item.url)
      respond_with @readable_item, root: false
    end
  end
end