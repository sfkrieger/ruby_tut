class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  # GET /users
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /products/1
  def show
    # //but you don't need to do this... because its not done in the other ones... its passed implicity...?
    @user = User.find(params[:id])
  end

  def new
    # don't really get this, it just creates a bunch of null fields
    @user = User.new
    # binding.pry
  end

  def create
    # @user = User.new(params[:user]) #why do we have to save this to an attribute?? why can't it just be a local var?
    @user = User.new(user_params) #why do we have to save this to an attribute?? why can't it just be a local var?
    if @user.save #if this action is successful and returns
      flash[:success] = "Well this is pretty weird..."
      log_in @user
      # redirect_to(user_url) this didn't work remember, its because you need to pass a parameter to user_url
      redirect_to(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Yep you're updated"
      redirect_to(@user)
    else
      render 'edit'
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "they're gone"
    redirect_to users_url
  end

  private
    def user_params
      # I think this means that you require the user as the paramter and the fields you're allowing within
      # That user obj are the name, email, password and password confirmation
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
      # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end