class ProfilesController < ApplicationController
  before_action :set_profile

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
