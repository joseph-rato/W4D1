class UsersController < ApplicationController 
  def index
    users = User.all 
    render json: users 
  end
  
  def create
    user = User.new(clean_params)
    if user.save 
      render json: user 
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: 404  
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.update(clean_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end
  
  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      render plain: 'user destroyed!'
    else
      render json: user.errors.full_messages, status: 404
    end 
  end
  
  private 
  def clean_params
    params.require(:user).permit(:email, :username)
  end
end