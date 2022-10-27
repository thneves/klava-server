class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show update destroy ]

  def create
    binding.pry
    @profile = Profile.new(profile_params)

    if @profile.save
      message = Klaviyo.new.create_profile(@profile)
      
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
