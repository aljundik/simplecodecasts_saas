class ProfilesController < ApplicationController
     def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # find the user id that actully logged in 

    @profile = @user.build_profile # to build a profile for that particular user ,,build_profile is a method available for us by rails , since we have established association in the data base and the routes file as well
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
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
  
end