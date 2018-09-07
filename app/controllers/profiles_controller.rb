class ProfilesController < ApplicationController
  before_action :set_profile
  

  def index
    @profile = current_user.profile
    @accounts = current_user.accounts

  end 

  def create
    @profile = current_user.profile.build(profile_params)
    respond_to do |format|
      if @profile.save
          format.html
          redirect_to current_user, notice: 'Contact information account was successfully created.'
        else
          format.html
          format.json
          flash[:notice] = "Sorry, could not create new conatct information account because #{ @profile.errors.full_messages.join(', ').downcase}."
          redirect_back(fallback_location: root_path)
        end
      end
  end
  
  def show 
    @profile = current_user.profile
  end 

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to edit_profiles_path, notice: "Successfully updated profile!"
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile!
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :personal_phone, :personal_address)
  end


end
