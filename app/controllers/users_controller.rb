class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
  @user = User.create(user_params)

    if @user.valid?
      token = JWT.encode({user_id: @user.id}, "secret")
      render json: { user: {username: @user.username}, token: token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end


  def get_user
    token = request.headers["authorization"]
    id = JWT.decode(token, "secret")[0]["user_id"]
    @user = User.find(id)
    if @user.valid?
      render json: { user: {username: @user.username}}
    end
  end

  private

  def user_params
   params.require(:auth.user).permit(:username, :password)
  end
end
