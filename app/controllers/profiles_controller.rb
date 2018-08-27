class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  
  def index
    @profiles = Profile.all.order("created_at DESC")
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, 
                                    :personal_email, :personal_phone, 
                                    :personal_address, :linkedin)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end

end
