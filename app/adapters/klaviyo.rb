class Adapters::Klavyio
  def create_profile(profile)

  end

  def add_profile
    
  end

  private

  def headers
    {
      'Content-Type': 'application/json',
      'Authorization': 'Klaviyo-API-Key pk_ef4cee4d92f530b239414025ba29dd54ee',
      'revision': '2022-10-26'
    }
  end

  def profile_url
    "https://a.klaviyo.com/api/profiles"
  end

  def list_url
    "https://a.klaviyo.com/api/lists/YrVvhv/relationships/profiles/"
  end

  def body
    {
      "data": {
        "type": "profile",
        "attributes": {
          "first_name": profile["first_name"],
          "last_name": profile["last_name"],
          "email": profile["email"],
          # "phone_number": profile["phone_number"]
        }
      }
    }
  end
end
