class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def create
    user = User.find_by(email: user_params[:email])

    if user&.authenticate(user_params[:password])
      expiration = 10.hours.from_now
      token = JsonWebToken.encode(user_id: user.id, exp: expiration)
      render json: {
                     email: user.email,
                     token: token,
                     expiration: expiration.strftime("%m-%d-%Y %H:%M"),
                   },
                   status: :ok
    else
      render json: { errors: 'bad_credentials' }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

