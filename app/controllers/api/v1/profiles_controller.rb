# API ProfilesController
class Api::V1::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)

    if @profile.valid?
      response = Klaviyo.add_profile(@profile)

      api_result(response)
    else
      message = @profile.errors.full_messages.join(', ')
      render_error(message)
    end
  end

  private

  def api_result(response)
    return render_error(api_error_message(response)) unless response.code == 204

    @profile.save!
    render_success
  end

  def render_success
    render status: 200, json: { message: 'Success!' }
  end

  def render_error(message)
    render status: 401, json: { message: message }
  end

  def api_error_message(api_response)
    response = api_response['errors'] || ''
    response&.map do |res|
      res['detail']
    end
  end
end

def profile_params
  params.require(:profile).permit(:first_name, :last_name, :email, :phone_number, :birth_date)
end
