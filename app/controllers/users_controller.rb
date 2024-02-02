class UsersController < ApplicationController

  def show
    current_user
    if @_current_user && current_user.admin?
      @user = User.find(params[:user_id])
    elsif @_current_user && current_user.default?
      @user = User.find(@_current_user.id)
    else
      flash[:error] = "Must be logged in to view your dashboard."
      redirect_to "/"
    end
  end

  def create
    user = users_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      render json: { success: "User created successfully", user_id: new_user.id }, status: :created
    else
      render json: { error: new_user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      render json: { error: "Incorrect credentials." }, status: :unprocessable_entity
    elsif user.authenticate(params[:user][:password])
      token = user.generate_auth_token
      render json: { success: "Welcome, #{user.email}!", token: token, email: params[:user][:email] }, status: 200
    else
      render json: { error: "Incorrect credentials." }, status: :unauthorized
    end
  end


  def logout
    # FE deletes token because we don't have sessions?????????????????????????
    reset_session
    flash[:success] = "You have been logged out successfully."
    redirect_to "/"
  end


  private
  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end