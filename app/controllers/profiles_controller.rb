class ProfilesController < ApplicationController
  def index 
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to root_path
    else
      rener 'new'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, 
                                    :personal_email, :personal_phone, 
                                    :personal_address)
  end
end
