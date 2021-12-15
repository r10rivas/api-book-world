class UsersController < ApplicationController
  skip_before_action :authenticate!

  def create
    user = User.new(user_params)

    if user.save
      render json: user.as_json(only: [:email]), status: :created
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
