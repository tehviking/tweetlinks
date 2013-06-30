module API
  class SharedItemsController < ApplicationController
    respond_to :json

    def index
      @shared_items = current_user.shared_items.all
      respond_with @shared_items
    end
  end
end