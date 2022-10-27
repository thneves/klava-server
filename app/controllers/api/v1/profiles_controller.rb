# API ProfilesController
class Api::V1::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      api_response = Klaviyo.add_profile(@profile)

      api_response.code == 204 ? render_success : render_error
    else
      render_error
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone_number, :birth_date)
  end

  def render_error
    render status: 401, json: { message: 'Invalid request.' }
  end

  def render_success
    render status: 200, json: { message: 'Success!' }
  end
end
