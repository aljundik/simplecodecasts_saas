class ProfilesController < ApplicationController
   before_action :authenticate_user!
  before_action :only_current_user
     def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # find the user id that actully logged in 
    @profile = Profile.new
   # @profile = @user.build_profile # to build a profile for that particular user ,,build_profile is a method available for us by rails , since we have established association in the data base and the routes file as well
  end
  def create 
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  def edit
  @user = User.find( params[:user_id] )
  @profile = @user.profile
end

def update
  @user = User.find( params[:user_id] )
  @profile = @user.profile# to make sure that we are editing that particular user
  if @profile.update_attributes(profile_params)
    flash[:success] = "Profile Updated!"
    redirect_to user_path( params[:user_id] )
  else
    render action: :edit
  end
end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
  
end