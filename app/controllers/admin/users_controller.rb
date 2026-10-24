# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    def index
      @users = User.order(:last_name, :first_name)
    end
  end
end
