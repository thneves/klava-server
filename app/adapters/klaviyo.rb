class Klaviyo
  def create_profile(profile)
    @profile = profile
    response = HTTParty.post(profile_url, headers: headers, body: profile_data.to_json)

    binding.pry
  end

  def add_profile
    HTTParty.post(list_url, headers: headers, body: list_data.to_json)
  end

  private

  def headers
    @headers ||= {
      Authorization: 'Klaviyo-API-Key pk_ef4cee4d92f530b239414025ba29dd54ee',
      'Content-Type': 'application/json',
      'revision': '2022-10-26'
    }
  end

  def profile_url
    @profile_url ||= 'https://a.klaviyo.com/api/profiles'
  end

  def list_url
    @list_url ||= "https://a.klaviyo.com/api/lists/YrVvhv/relationships/profiles/"
  end

  def profile_data
    @profile_data ||= {
      "data": {
        "type": "profile",
        "attributes": {
          "first_name": @profile.first_name,
          "last_name": @profile.last_name,
          "email": @profile.email,
          # "phone_number": profile["phone_number"]
        }
      }
    }
  end

  def list_data(profile_id)
    @list_data ||= {
      "data": {
        "type": "profile",
        "id": profile_id
      }
    }
  end
end
