class ProfilesController < ApplicationController
     def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # find the user id that actully logged in 
    @variable = params[:hello]
    @profile = @user.build_profile # to build a profile for that particular user ,,build_profile is a method available for us by rails , since we have established association in the data base and the routes file as well
  end
  
end