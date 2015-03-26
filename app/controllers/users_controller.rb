class UsersController < ApplicationController

  # GET /users
  def index
    @all_users = User.all
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
      # redirect_to(user_url) this didn't work remember, its because you need to pass a parameter to user_url
      redirect_to(@user)
    else
      render 'new'
    end
  end


  private
    def user_params
      # I think this means that you require the user as the paramter and the fields you're allowing within
      # That user obj are the name, email, password and password confirmation
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  # def index
  #   @all_users = User.all.map { |user| user.name }
  # end
end
