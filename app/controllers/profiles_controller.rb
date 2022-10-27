class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show update destroy ]

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone_number, :birth_date)
  end
end
