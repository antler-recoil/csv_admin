# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    def index
      @users = User.order(:last_name, :first_name)

      respond_to do |format|
        format.html
        format.csv do 
          send_data  "\uFEFF" + @users.to_csv,
                    filename: "users-#{Date.current}.csv",
                    type: "text/csv; charset=utf-8"
        end
      end
    end
  end
end
