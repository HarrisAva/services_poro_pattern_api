class UsersController < ApplicationController
  def create
    # user = User.new(user_params) # original
    user = UserService::Base.create_user(user_params) # use PORO user_service
    # if user.save # original
    #if user.valid? # use PORO user_service
    if result.success? # use PORO service_contract
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # filtering users
  def index
    users = UserService::Base.filter_users(params)
    render json: users, status: :ok
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
