# static home page
class StaticController < ApplicationController
  def home
    render json: { status: "it's working" }
  end
end
