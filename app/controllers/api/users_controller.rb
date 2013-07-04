module Api
  class UsersController < ApplicationController
    respond_to :json
    def index
      @user = current_user
      respond_with @user, root: false
    end

    def show
      @user = current_user
      respond_with @user, root: false
    end
  end
end