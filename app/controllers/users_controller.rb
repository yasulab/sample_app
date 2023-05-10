class UsersController < ApplicationController
  # GET /users/:id
  def show
    #@user = User.first
    @user = User.find(params[:id])

    # => app/views/users/show.html.erb
  end

  # GET /users/new or /signup
  def new
    @user = User.new

    # render 'new'
    # => app/views/users/new.html.erb
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # => Success / alert-success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
      #redirect_to user_path(@user)    # => GET /users/:id
      #redirect_to user_path(@user.id) # => GET /users/2
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end
  end

  private

  # Strong Parameters
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end
end
