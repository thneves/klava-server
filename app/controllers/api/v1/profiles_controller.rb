class Api::V1::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save
      api_response = Klaviyo.add_profile(@profile)

      if api_response.code == 204
        render status: 200, json: { message: "Success"}
      else
        render_error
      end
    else
      render_error
    end
  end

  private
  
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone_number, :birth_date)
  end

  def render_error
    render status: 401, json: { message: "Invalid request." }
  end
end
