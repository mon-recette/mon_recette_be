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

  # def new
  #   @user = User.new
  # end

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

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "Sorry, we are unable to find a user with this e-mail. Please check credentials or create an account."
      redirect_to login_path
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      # flash[:success] = "Welcome, #{user.email}!"
      initiate_verification(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end


  def logout
    reset_session
    flash[:success] = "You have been logged out successfully."
    redirect_to "/"
  end


  private
  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end