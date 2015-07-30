class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.includes(:profile) # save all the users into the instant variable
  end
  def show
    @user = User.find( params[:id] ) # example of editng
  end
end