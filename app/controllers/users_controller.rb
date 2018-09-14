class UsersController < ApplicationController

  def index
    render :new
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

     if @user.save
       log_in_user!(@user)
       redirect_to user_url(@user)
     else
       # debugger
       flash.now[:errors] = @users.errors.full_messages
       render :new
     end
  end

  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)


  end

end
