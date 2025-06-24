class HomepagesController < ApplicationController
  allow_unauthenticated_access
  skip_before_action :authenticate_request

  def index
  end
end
